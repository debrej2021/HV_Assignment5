#!/bin/bash

# Get the username
USERNAME=$(whoami)

# Get the user ID (UID)
USER_ID=$(id -u)

# Get the group ID (GID)
GROUP_ID=$(id -g)

# Get the home directory
HOME_DIR=$HOME

# Get the shell being used
USER_SHELL=$SHELL

# Display the information
echo "User Information:"
echo "-----------------"
echo "Username:        $USERNAME"
echo "User ID (UID):   $USER_ID"
echo "Group ID (GID):  $GROUP_ID"
echo "Home Directory:  $HOME_DIR"
echo "Shell:           $USER_SHELL"
