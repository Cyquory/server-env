#!/usr/bin/env bash

# Download the repo and run this file for all installation

REPO_LINK="https://github.com/Wang-jun-jjie/ais-env"
INSTALL_PATH="/opt/ais-env"
MOTD_PATH="/etc/update-motd.d"
BIN_PATH="/usr/local/bin"

sudo git clone "${REPO_LINK}" "${INSTALL_PATH}"

# Package
cd ${INSTALL_PATH}/package

sudo bash install-essential.sh
sudo bash install-docker.sh
sudo bash install-netdata.sh