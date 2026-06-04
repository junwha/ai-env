#!/bin/bash
# B300 (Blackwell Ultra, sm_103) needs CUDA 13.0+ and driver R570+ (R580 recommended).
# CUDA 12.6 / driver 560 used by install_cuda.sh do NOT support Blackwell.
DOWNLOAD_DIR=$1
cd $DOWNLOAD_DIR

export DEBIAN_FRONTEND=noninteractive

# CUDA network repo (more robust than a pinned .run for new arches)
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update

# Open kernel driver (required for Blackwell datacenter GPUs) + CUDA 13.0 toolkit
sudo apt-get -y install nvidia-open
sudo apt-get -y install cuda-toolkit-13-0

echo 'export PATH=/usr/local/cuda-13.0/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-13.0/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
