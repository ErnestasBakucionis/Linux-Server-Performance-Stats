#!/bin/bash

# Enable colors
RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
CYAN="\033[36m"
YELLOW="\033[33m"
RESET="\033[0m"

# CPU Usage Function
cpu_usage() {
  echo -e "${CYAN}===== CPU Usage =====${RESET}"
  local cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
  local cpu_usage=$(echo "100 - $cpu_idle" | bc)
  echo -e "${YELLOW}Total CPU Usage:${RESET} ${GREEN}${cpu_usage}%${RESET}"
}

# Memory Usage Function
memory_usage() {
  echo -e "${CYAN}===== Memory Usage =====${RESET}"
  local mem_info=$(free -m)
  local total_mem=$(echo "$mem_info" | awk '/Mem:/ {print $2}')
  local used_mem=$(echo "$mem_info" | awk '/Mem:/ {print $3}')
  local free_mem=$(echo "$mem_info" | awk '/Mem:/ {print $4}')
  local mem_percentage=$(echo "scale=2; $used_mem / $total_mem * 100" | bc)
  echo -e "${YELLOW}Total Memory:${RESET} ${GREEN}${total_mem}MB${RESET}"
  echo -e "${YELLOW}Used Memory:${RESET} ${GREEN}${used_mem}MB (${mem_percentage}%)${RESET}"
  echo -e "${YELLOW}Free Memory:${RESET} ${GREEN}${free_mem}MB${RESET}"
}

# Disk Usage Function
disk_usage() {
  echo -e "${CYAN}===== Disk Usage =====${RESET}"
  local disk_usage=$(df -h --total | grep "total")
  local total_space=$(echo "$disk_usage" | awk '{print $2}')
  local used_space=$(echo "$disk_usage" | awk '{print $3}')
  local free_space=$(echo "$disk_usage" | awk '{print $4}')
  local usage_percentage=$(echo "$disk_usage" | awk '{print $5}')
  echo -e "${YELLOW}Total Disk Space:${RESET} ${GREEN}$total_space${RESET}"
  echo -e "${YELLOW}Used Disk Space:${RESET} ${GREEN}$used_space (${usage_percentage})${RESET}"
  echo -e "${YELLOW}Free Disk Space:${RESET} ${GREEN}$free_space${RESET}"
}

# Top CPU Processes Function
top_cpu_processes() {
  echo -e "${CYAN}===== Top 5 Processes by CPU Usage =====${RESET}"
  echo -e "${YELLOW}PID    COMMAND         %CPU${RESET}"
  ps --no-headers -eo pid,comm,%cpu --sort=-%cpu | head -n 5 | awk '{printf "%-6s %-15s %-6s\n", $1, $2, $3}'
}

# Top Memory Processes Function
top_memory_processes() {
  echo -e "${CYAN}===== Top 5 Processes by Memory Usage =====${RESET}"
  echo -e "${YELLOW}PID    COMMAND         %MEM${RESET}"
  ps --no-headers -eo pid,comm,%mem --sort=-%mem | head -n 5 | awk '{printf "%-6s %-15s %-6s\n", $1, $2, $3}'
}

# Additional Stats Function
extra_stats() {
  echo -e "${CYAN}===== Additional Stats =====${RESET}"
  echo -e "${YELLOW}OS Version:${RESET} ${GREEN}$(lsb_release -d | cut -f2)${RESET}"
  echo -e "${YELLOW}Uptime:${RESET} ${GREEN}$(uptime -p)${RESET}"
  echo -e "${YELLOW}Load Average:${RESET} ${GREEN}$(uptime | awk -F'load average:' '{print $2}')${RESET}"
  echo -e "${YELLOW}Logged In Users:${RESET}"
  who
}

# Main Function to Run All Stats
main() {
  cpu_usage
  echo
  memory_usage
  echo
  disk_usage
  echo
  top_cpu_processes
  echo
  top_memory_processes
  echo
  extra_stats
}

# Execute main function
main
