#!/bin/bash
DOWNLOAD_DIR=$1
cd $DOWNLOAD_DIR

# NVIDIA driver
# sudo apt install nvidia-driver-570

# CUDA
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-6

wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda_11.8.0_520.61.05_linux.run # For later use
# sudo sh cuda_11.8.0_520.61.05_linux.run

