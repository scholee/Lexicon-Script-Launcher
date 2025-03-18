# Lexicon Script Launcher

A simple GUI tool for automating Lexicon database backup and export.

## Features
- Run backup and export scripts.
- Customizable configuration (`config.json`).

---

## 📥 Installation Guide

### **Step 1: Download & Extract the App**
1. **Download the ZIP package**:  
   📥 [Lexicon-Script-Launcher-Final-Public.zip](sandbox:/mnt/data/Lexicon-Script-Launcher-Final-Public.zip)  
2. **Locate the downloaded file** (usually in `Downloads`).
3. **Extract the ZIP file** by double-clicking it.
4. **Move the extracted folder** to a location of your choice, e.g.:  
   ```bash
   mv ~/Downloads/Lexicon-Script-Launcher ~/Applications/
   ```

---

### **⚙️ Step 2: Install Required Dependencies**
Before running the launcher, ensure that **Python 3** and **Tkinter** are installed.  

#### **Check if Python 3 is Installed**
1. Open **Terminal** (`Cmd + Space`, then type "Terminal" and press Enter).
2. Run the following command:
   ```bash
   python3 --version
   ```
3. If Python is installed, you will see something like:
   ```
   Python 3.X.X
   ```
4. If Python is **not installed**, download it from [python.org](https://www.python.org/downloads/) or install via Homebrew:
   ```bash
   brew install python
   ```

#### **Install Tkinter (if needed)**
Tkinter is required for the GUI. Run:
```bash
pip install tk
```

---

### **🛠 Step 3: Configure Your Paths**
You need to edit `config.json` to specify the correct paths for your Lexicon setup.

#### **1. Open the Configuration File**
- Navigate to the **Lexicon-Script-Launcher folder** in Finder.
- Open the file **`config.json`** in a text editor (e.g., Sublime Text, TextEdit).

#### **2. Modify the Paths**
Replace `/path/to/...` with the actual paths on your system:
```json
{
    "backup_script": "scripts/backup_and_export.sh",
    "lexicon_directory": "/Users/YOUR_USERNAME/Music/Lexicon",
    "source_database": "/Users/YOUR_USERNAME/Library/Application Support/Lexicon/main.db",
    "backup_database": "/Users/YOUR_USERNAME/Documents/Lexicon_Backup/main_copy.db",
    "tables_directory": "/Users/YOUR_USERNAME/Documents/Lexicon_CSVs/"
}
```

**Save the file** after making changes.

---

### **🚀 Step 4: Run the App**
#### **Method 1: Run from Terminal**
1. Open **Terminal** and navigate to the folder:
   ```bash
   cd ~/Applications/Lexicon-Script-Launcher
   ```
2. Run the GUI:
   ```bash
   python3 launch_scripts_gui.py
   ```

#### **Method 2: Create a macOS App Shortcut**
If you want to **double-click to launch**:
1. Open **Automator** (`Cmd + Space`, type "Automator", press Enter).
2. Click **File > New > Application**.
3. Choose **Run Shell Script**.
4. Paste the following command:
   ```bash
   python3 ~/Applications/Lexicon-Script-Launcher/launch_scripts_gui.py
   ```
5. Click **File > Save** and name it **Lexicon Script Launcher**.
6. Place it in `/Applications/` for easy access.

---

### **🔄 Step 5: Using the GUI**
1. **Launch the GUI** (from Terminal or macOS shortcut).
2. **Click “Run Backup and Export”** to:
   - Copy the Lexicon database to the backup directory.
   - Export Lexicon tables as CSV files.
3. **Check the output log** for status updates.

---

### **🎯 Troubleshooting**
| Issue | Solution |
|-------|---------|
| `"python3: command not found"` | Install Python 3: `brew install python` |
| `"No module named tk"` | Install Tkinter: `pip install tk` |
| `"Permission denied"` | Run: `chmod +x scripts/*.sh` and retry |

---

### **✅ Summary**
1️⃣ **Download & Extract**  
2️⃣ **Install Python & Tkinter**  
3️⃣ **Edit `config.json` with your paths**  
4️⃣ **Run the GUI (`python3 launch_scripts_gui.py`)**  
5️⃣ **Use the interface to back up and export Lexicon data**  

---

🎉 **You're all set!** 🚀 Let me know if you need further tweaks! 😊
