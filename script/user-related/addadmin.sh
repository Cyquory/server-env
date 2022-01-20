#!/usr/bin/env bash

PERSONNEL=$1
NAME=$2
GROUP="aislab"
ADMINGROUP="aislabadmin"
PASSWD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)

if [ "${PERSONNEL}" == "" ] || ["${NAME}" == ""]
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
  --disabled-password

echo "${PERSONNEL}:${PASSWD}" | sudo chpasswd
echo "Username: ${PERSONNEL}"
echo "Password: ${PASSWD}"

if ! grep -q ${ADMINGROUP} /etc/group; then
  sudo groupadd ${ADMINGROUP}
fi

sudo usermod -a -G ${ADMINGROUP} ${PERSONNEL}
echo "remember to make ${ADMINGROUP} a sudo group by visudo"