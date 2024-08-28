#!/bin/bash

# Define the process name
PROCESS_NAME="apache2"

# Define the log file
LOG_FILE="process_monitor.log"

# Check if the process is running
if pgrep -x "$PROCESS_NAME" > /dev/null
then
    echo "$(date): $PROCESS_NAME is running." >> "$LOG_FILE"
else
    echo "$(date): $PROCESS_NAME is not running. Attempting to start it..." >> "$LOG_FILE"
    
    # Try to start the process
    sudo systemctl start "$PROCESS_NAME"
    
    # Check if the process started successfully
    if pgrep -x "$PROCESS_NAME" > /dev/null
    then
        echo "$(date): $PROCESS_NAME started successfully." >> "$LOG_FILE"
    else
        echo "$(date): Failed to start $PROCESS_NAME." >> "$LOG_FILE"
    fi
fi
