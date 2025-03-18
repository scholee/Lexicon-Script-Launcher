#!/bin/bash

# Load configuration
CONFIG_FILE="../config.json"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Config file not found. Please create config.json and define paths."
    exit 1
fi

SOURCE_DB=$(jq -r '.source_database' "$CONFIG_FILE")
DESTINATION_DB=$(jq -r '.backup_database' "$CONFIG_FILE")
OUTPUT_DIR=$(jq -r '.tables_directory' "$CONFIG_FILE")

# Step 1: Copy the original Lexicon database to the backup directory
echo "Copying Lexicon database to backup directory..."
cp "$SOURCE_DB" "$DESTINATION_DB"

if [ $? -eq 0 ]; then
    echo "Database copy successful: $DESTINATION_DB"
else
    echo "Failed to copy the database."
    exit 1
fi

# Step 2: Use the copied database for CSV exports
echo "Starting CSV export from the backup database..."

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Get a list of all tables in the backup database
TABLES=$(sqlite3 "$DESTINATION_DB" .tables)

# Loop through each table and export it to a CSV file
for TABLE in $TABLES; do
    echo "Exporting table: $TABLE"
    sqlite3 "$DESTINATION_DB" -header -csv "SELECT * FROM $TABLE;" > "${OUTPUT_DIR}${TABLE}.csv"
done

echo "Export completed!"
