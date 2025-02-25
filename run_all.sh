#!/bin/bash
DOWNLOAD_DIR=/pre
HUGGINGFACE_TOKEN=<fill with your token>
mkdir -p $DOWNLOAD_DIR

bash ./install_utils.sh $DOWNLOAD_DIR
bash ./install_cuda.sh $DOWNLOAD_DIR
bash ./install_docker.sh $DOWNLOAD_DIR
bash ./install_ai_toolkits.sh $HUGGINGFACE_TOKEN $DOWNLOAD_DIR
bash ./docker_images.sh $DOWNLOAD_DIR
bash ./download_ai_toolkits.sh $DOWNLOAD_DIR
bash ./setup_r1.sh $DOWNLOAD_DIR