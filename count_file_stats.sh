#!/bin/bash

# Check if a file argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 filename"
  exit 1
fi

# Get the file from the first argument
FILE=$1

# Check if the file exists
if [ ! -f "$FILE" ]; then
  echo "Error: File '$FILE' does not exist."
  exit 1
fi

# Count the number of lines, words, and characters
LINE_COUNT=$(wc -l < "$FILE")
WORD_COUNT=$(wc -w < "$FILE")
CHAR_COUNT=$(wc -m < "$FILE")

# Display the results
echo "File: $FILE"
echo "Lines: $LINE_COUNT"
echo "Words: $WORD_COUNT"
echo "Characters: $CHAR_COUNT"
