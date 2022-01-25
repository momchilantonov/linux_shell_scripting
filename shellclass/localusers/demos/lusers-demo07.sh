#!/bin/bash

# Demonstrate the use of shift and while loops

# Display the first three parameters
echo "Parameter 1: ${1}"
echo "Parameter 2: ${2}"
echo "Parameter 3: ${3}"

# Loop through all the parameters
while [[ "${#}" -gt 0 ]]
do
  echo "Number of paramteres: ${#}"
  echo "Parameter 1: ${1}"
  echo "Parameter 2: ${2}"
  echo "Parameter 3: ${3}"
  shift
done

