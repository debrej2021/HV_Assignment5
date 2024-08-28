#!/bin/bash

# Check if a file argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 filename"
  exit 1
fi

# Get the file from the first argument
FILE=$1

# Check if the file exists
if [ ! -e "$FILE" ]; then
  echo "Error: File '$FILE' does not exist."
  exit 1
fi

# Check read permission
if [ -r "$FILE" ]; then
  echo "The file '$FILE' has read permission."
else
  echo "The file '$FILE' does not have read permission."
fi

# Check write permission
if [ -w "$FILE" ]; then
  echo "The file '$FILE' has write permission."
else
  echo "The file '$FILE' does not have write permission."
fi

# Check execute permission
if [ -x "$FILE" ]; then
  echo "The file '$FILE' has execute permission."
else
  echo "The file '$FILE' does not have execute permission."
fi


