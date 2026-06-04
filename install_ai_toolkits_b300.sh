#!/bin/bash
# B300 (Blackwell Ultra, sm_103) build of the AI toolkit env.
# Differences vs install_ai_toolkits.sh: CUDA 13.0 (not 12.6) and PyTorch cu130 wheels.
DOWNLOAD_DIR=$1
cd $DOWNLOAD_DIR

# Conda
wget https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh && \
    chmod +x ./Anaconda3-2024.10-1-Linux-x86_64.sh && \
    ./Anaconda3-2024.10-1-Linux-x86_64.sh -b && \
    rm ./Anaconda3-2024.10-1-Linux-x86_64.sh

source ~/.bashrc

for version in 3.10 3.11 3.12; do
    # Python environment
    env_name="py${version//./}"
    conda create -y -n $env_name python=$version
    conda activate $env_name
    conda install -c "nvidia/label/cuda-13.0.0" cuda -y

    # Base packages (cu130 wheels carry sm_100/sm_103 kernels for Blackwell)
    pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu130
    # If stable cu130 still trips on sm_103 PTXAS, fall back to nightly:
    #   pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu130
    pip install torch_tb_profiler
    pip install tensorboard
done

# OpenCV
pip install opencv-python

# Nsight
sudo apt-get -y install nsight-systems
