#!/bin/bash

# Display the UID and username of the user executing the script
# Display if the user is root (admin) user ir not

# Display the UID
# There is a buildin vaiable UID
echo "Your UID is ${UID}"

# Display the username
USER_NAME=$(id -un)
# USER_NAME=`id -un`
echo "Your username is ${USER_NAME}"

# Display if the user is the root user or not
if [[ "${UID}" -eq 0 ]]
then
  echo 'You are root'
else
  echo 'You are not root'
fi

