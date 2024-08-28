#!/bin/bash

# Check if a directory argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/directory"
  exit 1
fi

# Define variables
SOURCE_DIR="$1"  # The directory to back up (passed as the first argument)
TIMESTAMP=$(date +%Y%m%d_%H%M%S)  # Current timestamp in the format YYYYMMDD_HHMMSS
BACKUP_DIR="$SOURCE_DIR/backup_$TIMESTAMP"  # Backup directory with timestamp

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Directory $SOURCE_DIR does not exist."
  exit 1
fi

# Create the backup directory
mkdir -p "$BACKUP_DIR"

# Copy all .txt files to the backup directory
cp "$SOURCE_DIR"/*.txt "$BACKUP_DIR" 2>/dev/null

# Check if the copy command was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully. Files are saved in $BACKUP_DIR"
else
  echo "No .txt files found in $SOURCE_DIR to back up."
fi
