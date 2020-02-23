#!/bin/bash

# This script was created to transform plain text passwords to base64.
# For informations about the usage of this script, execute the script passing -h for help

# For more info: https://github.com/abargiela/kubernetes_secret_encode_decode_base64

function backup() {
  # Create a backup file in the current file directory
  cp "${FILE}" "${FILE}"-bkp-"$(date +"%m-%d-%Y_%H-%M-%S")"
  echo "Backup file created at: ${FILE}-bkp-$(date +"%m-%d-%Y_%H-%M-%S")"
}

function encode() {
  # Test if is a regular file that you're trying to encode
  if [[ -f ${FILE} ]]; then
    backup
    tmpfile=$(mktemp)
    sed 's/^ *//; s/ *$//; /^$/d' "${FILE}" | awk '{ system ("var1=$(echo "$1");var2=$(/bin/echo -n "$2" | base64); echo ${var1} ${var2}") }' >"${tmpfile}"
    cat "${tmpfile}" >"${FILE}"
    rm -f "${tmpfile}"
  # If not a regular file, it's considered a string.
  else
    echo -n "${FILE}" | base64
  fi
}

function decode() {
  # Test if is a regular file that you're trying to decode
  if [[ -f ${FILE} ]]; then
    tmpfile=$(mktemp)
    awk '{ system ("var1=`echo "$1"`;var2=`echo "$2" | base64 --decode`; echo $var1 $var2") }' "${FILE}" >"${tmpfile}"
    cat "${tmpfile}" >"${FILE}"
    rm -f "${tmpfile}"
  # If not a regular file, it's considered a string.
  else
    echo "${FILE}" | base64 --decode
  fi
}

function helper() {
  echo -n "Usage: $0 [-e encode] [-d decode] file|string
Example: $0 -e /tmp/file_with_plain_passwords.txt"
  exit 1
}

function check_params() {
  # Check if you're passing the parameter correctly
  if [ -z "${FILE}" ]; then
    echo -e "You didin't pass the file\nUse $0 -h for help."
    exit 1
  fi
}

while getopts ":edh" opt; do
  case ${opt} in
  e)
    FILE=$2
    encode
    ;;
  d)
    FILE=$2
    decode
    ;;
  \? | h)
    helper
    ;;
  esac
done
shift $((OPTIND - 1))
check_params
