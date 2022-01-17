#!/bin/bash

# This script creates an account on the local system
# You will be prompted for the account name and password

# Ask for the username
read -p 'Enter the username: ' USER_NAME

# Ask for the real name
read -p 'Enter the name: ' COMMENT

# Ask for the password
read -p 'Enter the password: ' PASSWORD

# Create the user
useradd -c "${COMMENT}" -m ${USER_NAME}

# Set password for the user
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Force password change on first lgin
passwd -e ${USER_NAME}

