#!/usr/bin/env bash

# change to /tmp
cd /tmp

# install function
install () {
  CUDA_VERSION=$1
  CUDNN_VERSION=$2
  CUDA_LINK=$3
  CUDNN_LINK=$4

  # download cuda installer
  printf "Downlodaing CUDA ${CUDA_VERSION} installer... "
  curl -sSL "${CUDA_LINK}" -o cuda.run
  chmod +x cuda.run
  echo "Done."

  # download cudnn tar.xz
  printf "Downloading cuDNN ${CUDNN_VERSION} packages... "
  curl -sSL "${CUDNN_LINK}" -o cudnn.tar.xz
  echo "Done."

  # extends the sudo timeout for another 15 minutes
  sudo -v

  # install CUDA toolkit
  printf "Installing CUDA ${CUDA_VERSION}... "
  sudo ./cuda.run --silent --toolkit --override
  echo "Done."

  # install cuDNN library
  printf "Installing cuDNN ${CUDNN_VERSION}... "
  sudo tar --no-same-owner -xJf cudnn.tar.xz -C /usr/local
  # Copy the following files into the CUDA toolkit directory
  sudo cp cudnn-*-archive/include/cudnn*.h /usr/local/cuda/include
  sudo cp -P cudnn-*-archive/lib/libcudnn* /usr/local/cuda/lib64
  sudo chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda/lib64/libcudnn*
  echo "Done."

  # remove default symbloic link
  sudo rm /usr/local/cuda

  # clean up
  rm cuda.run cudnn.tar.xz
}

# install each version of CUDA and cuDNN
# install "11.3.1" "8.2.1" \
#   "https://developer.download.nvidia.com/compute/cuda/11.3.1/local_installers/cuda_11.3.1_465.19.01_linux.run" \
#   "https://developer.download.nvidia.com/compute/redist/cudnn/v8.2.1/cudnn-11.3-linux-x64-v8.2.1.32.tgz"

echo "Installation change after cuda 11.5, proceed with care!"
echo "This script cannot be apply to older versions"
install "11.5.1" "8.3.2" \
  "https://developer.download.nvidia.com/compute/cuda/11.5.1/local_installers/cuda_11.5.1_495.29.05_linux.run" \
  "http://developer.download.nvidia.com/compute/redist/cudnn/v8.3.2/local_installers/11.5/cudnn-linux-x86_64-8.3.2.44_cuda11.5-archive.tar.xz"

# default use cuda-11.5
ln -fns /usr/local/cuda-11.5 ~/.cuda
sudo ln -fns /usr/local/cuda-11.5 /etc/skel/.cuda