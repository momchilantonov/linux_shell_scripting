#!/bin/bash

# The goal of this exercise is to create a shell script that adds users
# to the same Linux system as the script is executed on.

# Make sure the script is being executed with superuser privileges
if [[ "${UID}" -ne 0 ]]
then
  echo 'Please run with sudo as root'
  exit 
fi

# Get the username (login)
read -p "Enter username: " USER_NAME

# Get the real name (contents for the description field)
read -p "Enter name: " COMMENT

# Get the password
read -p "Enter password: " PASSWORD

# Create the user with
useradd -c "${COMMENT}" -m ${USER_NAME}

# Check to see if the useradd command succeeded
if [[ "${?}" -ne 0 ]]
then
  echo 'The account could not be created'
  exit 1
fi

# Set the password
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Check to see if the passwd command succeeded
if [[ "${?}" -ne 0 ]]
then
  echo 'The password could not be set'
  exit 1
fi

# Force password change on first login
passwd -e ${USER_NAME}

# Display the username, password, and the host where the user was created
echo
echo "username:"
echo "${USER_NAME}"
echo
echo "password:"
echo "${PASSWORD}"
echo
echo "host:"
echo "${HOSTNAME}"
echo
exit 0

