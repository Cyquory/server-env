#!/usr/bin/env bash

# change to /tmp
cd /tmp

# make sure you have docker installed before running the script

# Setup the stable repository and the GPG key
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

# Install the nvidia-docker2 package
sudo apt update
sudo apt-get install -y nvidia-docker2

# Restart the Docker daemon
sudo systemctl restart docker
