import tkinter as tk
import subprocess
import threading
import json
import os

# Load configuration
config_path = os.path.join(os.path.dirname(__file__), "config.json")

if not os.path.exists(config_path):
    raise FileNotFoundError("Config file not found. Please create config.json and define paths.")

with open(config_path, "r") as f:
    config = json.load(f)

def execute_script(command, script_path, status_label, output_text):
    update_status(status_label, "Running")
    process = subprocess.Popen([command, script_path], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

    output_text.delete(1.0, tk.END)
    for line in process.stdout:
        output_text.insert(tk.END, line)
        output_text.see(tk.END)
        window.update_idletasks()

    process.wait()
    update_status(status_label, "Finished" if process.returncode == 0 else "Error")

def update_status(label, status):
    label.config(text=f"Status: {status}")

def run_backup_and_export():
    threading.Thread(target=execute_script, args=('bash', config["backup_script"], backup_status_label, output_text)).start()

window = tk.Tk()
window.title('Lexicon Script Launcher')
window.geometry('500x400')

backup_button = tk.Button(window, text='Run Backup and Export', command=run_backup_and_export, width=30, height=2)
backup_button.pack(pady=(20, 5))
backup_status_label = tk.Label(window, text="Status: Ready")
backup_status_label.pack(pady=(0, 10))

output_text = tk.Text(window, wrap=tk.WORD, height=10, width=60)
output_text.pack(pady=(10, 10))

window.mainloop()
