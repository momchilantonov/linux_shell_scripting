#!/bin/bash

# The goal of this exercise is to create a shell script 
# that displays the number of failed login attempts by and location

LIMIT='10'
LOG_FILE="${1}"

# Make sure a file was supplied as an argument
if [[ ! -e $"{LOG_FILE}" ]]
then
  echo "Cannot open log file: ${LOG_FILE}"
  exit 1
fi

# Display the CSV header
echo 'Count,IP,Location'

# Loop through list of failed attempts and corresponding IP addresses
grep Failed syslog-sample | awk '{print $(NF - 3)}' | sort | uniq -c | sort -nr | while reed COUNT IP
do
  # If the number of failed attempts is greater than the limit, display count, IP, and location
  if [[ ${COUNT} -gt "${LIMIT}" ]]
  then
    LOCATION=$(geoiplookup ${IP} | awk -F ', ' '{print $2 }')
    echo "${COUNT},${IP},${LOCATION}"
  fi
done
exit 0
