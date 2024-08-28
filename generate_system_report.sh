#!/bin/bash

# Define the output file
REPORT_FILE="system_report.txt"

# Get system uptime
UPTIME=$(uptime -p)

# Get memory usage
MEMORY_USAGE=$(free -h)

# Get CPU load
CPU_LOAD=$(top -bn1 | grep "load average" | awk '{print $10 $11 $12}')

# Get disk usage
DISK_USAGE=$(df -h /)

# Get running processes
RUNNING_PROCESSES=$(ps aux --sort=-%mem | head -n 10)

# Write the report to the file
{
    echo "System Information Report"
    echo "========================="
    echo ""
    echo "System Uptime:"
    echo "$UPTIME"
    echo ""
    echo "Memory Usage:"
    echo "$MEMORY_USAGE"
    echo ""
    echo "CPU Load (1, 5, 15 min):"
    echo "$CPU_LOAD"
    echo ""
    echo "Disk Usage:"
    echo "$DISK_USAGE"
    echo ""
    echo "Top 10 Running Processes by Memory Usage:"
    echo "$RUNNING_PROCESSES"
} > "$REPORT_FILE"

# Notify the user
echo "System information report generated and saved to $REPORT_FILE"
