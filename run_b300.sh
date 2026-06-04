#!/bin/bash
DOWNLOAD_DIR=/pre
HUGGINGFACE_TOKEN=<fill with your token>
mkdir -p $DOWNLOAD_DIR

bash ./install_utils.sh $DOWNLOAD_DIR
bash ./setup_storage_b300.sh                     # /raid/.docker images + /raid/.cache (run before docker)
# bash ./install_cuda_b300.sh $DOWNLOAD_DIR       # CUDA 13.0 + driver R580 (Blackwell sm_103); enable on a bare host
bash ./install_docker.sh $DOWNLOAD_DIR
bash ./install_ai_toolkits_b300.sh $DOWNLOAD_DIR  # conda envs, PyTorch cu130 (not cu126)
bash ./install_uv_env.sh $DOWNLOAD_DIR            # uv + Python 3.13 venv, broad AI/ML stack

bash ./docker_images_b300.sh $DOWNLOAD_DIR
bash ./download_b300_models.sh $HUGGINGFACE_TOKEN

git clone --branch b300 https://github.com/junwha/LLMServingSim && \
    cd profiler && bash install.sh && \
    bash profile_all.sh