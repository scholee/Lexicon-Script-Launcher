#!/bin/bash

echo "Setting up Lexicon Script Launcher..."

# Set execution permissions for scripts
chmod +x scripts/*.sh

# Ensure Python dependencies are installed
pip3 install tk

echo "Installation complete! Run the GUI with:"
echo "python3 launch_scripts_gui.py"
