#!/bin/bash

# Use the current user's home directory
BASE_DIR="$HOME"

# Define the directories to be created
DIRECTORIES=(
  "$BASE_DIR/projects/project1"
  "$BASE_DIR/projects/project2"
  "$BASE_DIR/projects/project3"
  "$BASE_DIR/documents"
  "$BASE_DIR/downloads"
)

# Create the directories
for DIR in "${DIRECTORIES[@]}"; do
  if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
    echo "Created directory: $DIR"
  else
    echo "Directory already exists: $DIR"
  fi
done

echo "Directory structure created successfully."
