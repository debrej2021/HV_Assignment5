#!/bin/bash

# Set the threshold percentage
THRESHOLD=80

# Get the current disk usage percentage of the root filesystem
USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//g')

# Email address of the system administrator
ADMIN_EMAIL="debkiitian@gmail.com"

# Check if the usage is above the threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
  # Prepare the email content
  SUBJECT="Disk Space Alert: Root Filesystem Usage at ${USAGE}%"
  BODY="Warning: The root filesystem disk usage has reached ${USAGE}%. Please take necessary actions."

  # Send the email using postfix
  echo -e "Subject: $SUBJECT\n\n$BODY" | sendmail "$ADMIN_EMAIL"

  echo "Disk usage is above ${THRESHOLD}%. Email alert sent to $ADMIN_EMAIL."
else
  echo "Disk usage is under control at ${USAGE}%. No action needed."
fi

