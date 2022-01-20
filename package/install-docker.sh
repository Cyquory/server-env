#!/usr/bin/env bash

# extends the sudo timeout for another 15 minutes
sudo -v

# uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# update apt repo
sudo apt update
# install docker dependency
sudo apt install ca-certificates \
                 gnupg \
                 lsb-release

# add docker's officical GPG keys
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# set up the stable repository
 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# verify docker
sudo docker run hello-world

# Post-installation steps for Linux
# Manage Docker as a non-root user

# add current user to docker group
sudo groupadd docker
sudo usermod -aG docker ${USER}
sudo chmod 666 /var/run/docker.sock

# verify user (after reboot)
# docker run hello-world

# Install Docker Compose
# download the current stable release of Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# Apply executable permissions
sudo chmod +x /usr/local/bin/docker-compose

# test the installation
docker-compose --version