#!/usr/bin/env bash

PERSONNEL=$1
NAME=$2
GROUP="aislab"
PASSWD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)

if [ "${PERSONNEL}" = "" ] || ["${NAME}" = ""]
then
  echo "Usage: $0 <account id> <full name>"
  exit 1
fi

sudo -v

if ! grep -q ${GROUP} /etc/group; then
  sudo groupadd ${GROUP}
fi

sudo adduser ${PERSONNEL} \
  --ingroup ${GROUP} \
  --gecos "${NAME},RoomNumber,WorkPhone,HomePhone" \

echo "${PERSONNEL}:${PASSWD}" | sudo chpasswd
echo "Username: ${PERSONNEL}"
echo "Password: ${PASSWD}"