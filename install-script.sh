#!/usr/bin/env bash

# Download the repo and run this file for all installation

REPO_LINK="https://github.com/Cyquory/server-env"
INSTALL_PATH="/opt/server-env"
MOTD_PATH="/etc/update-motd.d"
BIN_PATH="/usr/local/bin"

# sudo git clone "${REPO_LINK}" "${INSTALL_PATH}"

# Script
cd ${INSTALL_PATH}/script
# user
for s in $(ls -A -I profile.d); do
  for ss in $(ls ${s}); do
    sudo ln -fns $(pwd)/${s}/${ss} ${BIN_PATH}/${ss}
  done
done
# profile.d (run at login)
for ss in $(ls -A profile.d); do
  sudo ln -fns $(pwd)/profile.d/${ss} /etc/profile.d/${ss}
done