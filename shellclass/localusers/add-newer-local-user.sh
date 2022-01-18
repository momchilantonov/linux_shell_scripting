#!/bin/bash

# Make sure the script is being executed with superuser privileges
if [[ "${UID}" -ne 0 ]]
then
  echo "Please run with sudo or as root" >&2
  exit 1
fi

# If the user doesn't supply at least one argument, then give them help
if [[ "${#}" -lt 1 ]]
then
  echo "Usage: ${0} USER_NAME [COMMENT]..." >&2
  echo "Create an account on the local system with the name of USER_NAME and a comment field of COMMENT" >&2
  exit 1
fi

# The first parameter is the user name
USER_NAME="${1}"

# The rest of the parameters are for the account comments
shift
COMMENT="${@}"

# Generate a password
PASSWORD=$(date +%s%N${RANDOM} | sha256sum | head -c32)

# Create the user with the password
useradd -c "${COMMENT}" -m ${USER_NAME} &> /dev/null

# Check to see if the useradd command succeeded
if [[ "${?}" -ne 0 ]]
then
  echo "Account could not be create" >&2
  exit 1
fi

# Set the password
echo ${PASSWORD} | passwd --stdin ${USER_NAME} &> /dev/null

# Check to see if the passwd command succeeded
if [[ "${?}" -ne 0 ]]
then
  echo "Password could not be set" >&2
  exit 1
fi

# Force password change on first login
passwd -e ${USER_NAME} &> /dev/null

# Display the username, password, and the host where the user was created.
echo "username:"
echo "${USER_NAME}"
echo
echo "password:"
echo "${PASSWORD}"
echo
echo "host:"
echo "${HOSTNAME}"
echo
echo "comment:"
echo "${COMMENT}"

