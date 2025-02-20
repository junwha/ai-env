#!/bin/bash
DOWNLOAD_DIR=$1
cd $DOWNLOAD_DIR

DATASETS=""
MODELS=""
TOKEN=$1

pip install -U "huggingface_hub[cli]" 

huggingface-cli login --token $TOKEN


for d in $DATASETS; do
    huggingface-cli download --repotype dataset $d
done

for m in $MODELS; do
    huggingface-cli download --repotype model $m 
done
