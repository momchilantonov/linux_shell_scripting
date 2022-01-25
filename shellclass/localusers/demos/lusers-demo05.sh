#!/bin/bash

# This script generates a list of  random passwords

# A random number in the password
PASSWORD="${RANDOM}"
echo "${RANDOM}"

# Three random numbers together
PASSWORD="${PASSWORD}${PASSWORD}${PASSWORD}"
echo "${PASSWORD}"

# Use the current data/time as the basis for the passwor
PASSWORD=$(date +%s)
echo "${PASSWORD}"

# Use nanoseconds to act as randomization
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

# A better password
PASSWORD=$(date +%s%N | sha256sum | head -c 32)
echo "${PASSWORD}"

# A even better password
PASSWORD=$(date +%s%N{RANDOM}{RANDOM} | sha256sum | head -c 48)
echo "${PASSWORD}"

# Append a special character to the password
SPECIAL_CHARACTER=$(echo '!@#$%^&*()_+,.' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"

