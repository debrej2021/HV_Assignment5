#!/bin/bash

# Define the source and destination directories
SOURCE_DIR="/home/user/documents"
BACKUP_DIR="/home/user/backup"

# Define the name of the backup file
BACKUP_FILE="documents_backup.tar.gz"

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Compress the documents directory into a tarball
tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .

# Move the tarball to the backup directory
mv "$BACKUP_FILE" "$BACKUP_DIR/"

# Print a success message
echo "Backup of $SOURCE_DIR completed successfully. The backup is saved as $BACKUP_DIR/$BACKUP_FILE."
