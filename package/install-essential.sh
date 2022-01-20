#!/usr/bin/env bash

# extends the sudo timeout for another 15 minutes
sudo -v

# update apt repo
sudo apt update
# install monitoring tools
sudo apt install -y htop
# install common used apps
sudo apt install -y build-essential \
                    make \
                    cmake \
                    dkms \
                    sshfs \
                    zip \
                    ppa-purge

# install Python build dependencies
sudo apt install -y libssl-dev \
                    zlib1g-dev \
                    libbz2-dev \
                    libreadline-dev \
                    libsqlite3-dev \
                    llvm \
                    libncursesw5-dev \
                    xz-utils \
                    tk-dev \
                    libxml2-dev \
                    libxmlsec1-dev \
                    libffi-dev \
                    liblzma-dev

