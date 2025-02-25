#!/bin/bash
DOWNLOAD_DIR=/pre
mkdir -p $DOWNLOAD_DIR

bash ./install_utils.sh $DOWNLOAD_DIR
bash ./install_cuda.sh $DOWNLOAD_DIR
bash ./install_docker.sh $DOWNLOAD_DIR
