#!/usr/bin/env bash

# change to /tmp
cd /tmp

# useful variables
DRIVER_VERSION="510.54" # CUDA Version: 11.6
DRIVER_INSTALLER="NVIDIA-Linux-x86_64-${DRIVER_VERSION}.run"
DRIVER_LINK="http://us.download.nvidia.com/XFree86/Linux-x86_64/${DRIVER_VERSION}/${DRIVER_INSTALLER}"

# extends the sudo timeout for another 15 minutes
sudo -v
sudo apt install -y freeglut3-dev \
                    libx11-dev \
                    libxmu-dev \
                    libxi-dev \
                    libglu1-mesa \
                    libglu1-mesa-dev \
                    build-essential \
                    dkms 

# download installer
printf "Downlodaing NVIDIA driver ${DRIVER_VERSION} installer... "
curl -sSL "${DRIVER_LINK}" -o "${DRIVER_INSTALLER}"
chmod +x "${DRIVER_INSTALLER}"
echo "Done."

# install NVIDIA driver
printf "Installing NVIDIA driver ${DRIVER_VERSION}... "
sudo ./"${DRIVER_INSTALLER}" --silent --dkms --run-nvidia-xconfig
echo "Done."

# clean up
rm "${DRIVER_INSTALLER}"
