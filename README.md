# Linux Server Performance Stats
**Project Page URL**: https://roadmap.sh/projects/server-stats

This script collects and displays various system statistics, including CPU usage, memory usage, disk usage, top CPU and memory-consuming processes, and additional system information such as OS version, uptime, load average, and logged-in users.

---

## Features:

1. **CPU Usage**: Displays the total CPU usage (percentage of CPU utilization).
2. **Memory Usage**: Shows total, used, and free memory, along with the percentage of memory used.
3. **Disk Usage**: Displays the total, used, and free disk space along with the percentage of usage.
4. **Top CPU Processes**: Lists the top 5 processes consuming the most CPU.
5. **Top Memory Processes**: Lists the top 5 processes consuming the most memory.
6. **Additional Stats**: Shows OS version, system uptime, load average, and logged-in users.

---

## Requirements:

Before running the script, ensure the following tools are installed on your system:

1. **bc**: A basic calculator for performing floating-point calculations (required for calculating CPU and memory usage percentages).
   - To install `bc` on Debian/Ubuntu-based systems:
     ```bash
     sudo apt update
     sudo apt install bc
     ```

2. **Other dependencies**: The script uses standard utilities available on most Linux distributions:
   - `top`
   - `awk`
   - `ps`
   - `df`
   - `uptime`
   - `who`
   - `lsb_release`
   
   These utilities are typically installed by default.

---

## Instructions for Running the Script

### **Option 1: Clone from GitHub**

1. **Clone the repository**  
   You can clone the repository using the following command:
   ```bash
   git clone https://github.com/ErnestasBakucionis/Linux-Server-Performance-Stats.git
   ```

2. **Navigate to the repository folder:**

   If you have a GitHub repository with the script, you can clone it using the following command:
   ```bash
   cd Linux-Server-Performance-Stats
   ```

### **Option 2: Download or Create the Script**

1. **Download or create the script:**

   Save the script to a file, e.g., `system_stats.sh`.

### **After cloning repository or creating script**

1. **Give the script execute permissions**

   Open your terminal and run the following command to make the script executable:
   ```bash
   chmod +x system_stats.sh
   ```

2. **Run the script**

   Execute the script by running:
   ```bash
   ./system_stats.sh
   ```

## **Troubleshooting** ##

*   **bc: command not found**: If you see an error like this, it means bc is not installed on your system. Follow the instructions in the **Requirements** section to install it.
    
*   **Permission Denied**: If you encounter a "Permission Denied" error, make sure you’ve made the script executable with chmod +x.
*   

## **Sample Output** ##
```shell
===== CPU Usage =====
Total CPU Usage: 34.86%

===== Memory Usage =====
Total Memory: 27761MB
Used Memory: 11816MB (42.56%)
Free Memory: 15945MB

===== Disk Usage =====
Total Disk Space: 3020GB
Used Disk Space: 2191GB (72.55%)
Free Disk Space: 829GB

===== Top 5 Processes by CPU Usage =====
PID    COMMAND         %CPU
1568   process0        8.41
9432   process1        9.71
5955   process2        3.58
6343   process3        1.59
2584   process4        9.21

===== Top 5 Processes by Memory Usage =====
PID    COMMAND         %MEM
899    process0        1.01
5689   process1        3.82
7276   process2        6.33
4786   process3        7.44
3997   process4        7.25

===== Additional Stats =====
OS Version: Ubuntu 22.04.4 LTS
Uptime: up 27 minutes
Load Average: 0.1, 0.67, 0.81
Logged In Users:
user0   pts/2        2024-12-19 21:36
user1   pts/0        2024-12-19 21:39
```