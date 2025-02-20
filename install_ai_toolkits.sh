#!/bin/bash
DOWNLOAD_DIR=$1
cd $DOWNLOAD_DIR

# Conda
wget https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh && \
    chmod +x ./Anaconda3-2024.10-1-Linux-x86_64.sh && \
    ./Anaconda3-2024.10-1-Linux-x86_64.sh -b && \
    rm ./Anaconda3-2024.10-1-Linux-x86_64.sh

source ~/.bashrc

for version in 3.9 3.10 3.11 3.12; do
    # Python environment
    env_name="py${version//./}"
    conda create -y -n $env_name python=$version
    conda activate $env_name
    conda install -c "nvidia/label/cuda-12.6.3" cuda -y #! 12.8

    # Base packages
    pip install -y torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu126 #! 12.8
    pip install -y torch_tb_profiler
    pip install -y tensorboard
done

# OpenCV
pip install -y opencv-python

# Nsight
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo add-apt-repository -y "deb https://developer.download.nvidia.com/devtools/repos/ubuntu$(source /etc/lsb-release; echo "$DISTRIB_RELEASE" | tr -d .)/$(dpkg --print-architecture)/ /"
sudo apt -y install nsight-systems
