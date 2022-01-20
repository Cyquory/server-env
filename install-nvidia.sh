#!/usr/bin/env bash

REPO_LINK="https://github.com/Cyquory/server-env"
INSTALL_PATH="/opt/server-env"
MOTD_PATH="/etc/update-motd.d"
BIN_PATH="/usr/local/bin"

# sudo git clone "${REPO_LINK}" "${INSTALL_PATH}"

# Package
cd ${INSTALL_PATH}/package

sudo bash install-nvdriver.sh
sudo bash install-cudacudnn.sh
sudo bash install-nvidiadocker.sh