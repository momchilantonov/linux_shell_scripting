#!/bin/bash

log() {
  # This func sends a message to syslog and to standart output if VERBOSE is true
  local MESSAGE="${@}"
  if [[ "${VERBOSE}" = 'true' ]]
  then
    echo "${MESSAGE}"
  fi
  logger -t lusers-exer10.sh "${MESSAGE}"
}

backup_file() {
  # This func creates a backup of a file. Returns non-zero status on error
  local FILE="${1}"

  # Make sure the file exists
  if [[ -f "${FILE}" ]]
  then
    local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
    log "Backing up ${FILE} to ${BACKUP_FILE}"
    
    # This exit of the func will be the exit statusof the cp command
    cp -p ${FILE} ${BACKUP_FILE} 
  else
    # The file does not exist, so return a non-zero exit status
    return 1
  fi
}

readonly VERBOSE='true'
log 'Hello'
log 'This is fun'

backup_file '/etc/passwd'

# Make a decision based on the exit status of the func 
if [[ "${?}" -eq 0 ]]
then
  log 'File backup secceeded'
else
  log 'File backup failed'
fi

