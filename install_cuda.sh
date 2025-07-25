#!/bin/bash
DOWNLOAD_DIR=$1
cd $DOWNLOAD_DIR

# NVIDIA driver
# sudo apt install nvidia-driver-570

# CUDA
wget https://developer.download.nvidia.com/compute/cuda/12.6.0/local_installers/cuda_12.6.0_560.28.03_linux.run
sudo sh cuda_12.6.0_560.28.03_linux.run

wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda_11.8.0_520.61.05_linux.run # For later use
# sudo sh cuda_11.8.0_520.61.05_linux.run

