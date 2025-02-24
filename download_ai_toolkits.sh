#!/bin/bash

DATASETS=""
MODELS=""
TOKEN=$1

pip install -U "huggingface_hub[cli]" 

huggingface-cli login --token $TOKEN

huggingface-cli download stabilityai/stable-diffusion-2
huggingface-cli download stabilityai/stable-diffusion-2-base
huggingface-cli download stabilityai/stable-diffusion-3.5-large
huggingface-cli download stabilityai/stable-diffusion-3.5-medium

huggingface-cli download DeepFloyd/IF-I-XL-v1.0
huggingface-cli download DeepFloyd/IF-I-L-v1.0
huggingface-cli download DeepFloyd/IF-I-M-v1.0
huggingface-cli download DeepFloyd/IF-II-L-v1.0
huggingface-cli download DeepFloyd/IF-II-M-v1.0
huggingface-cli download stabilityai/stable-diffusion-x4-upscaler

huggingface-cli download PixArt-alpha/PixArt-Sigma-XL-2-1024-MS
huggingface-cli download PixArt-alpha/PixArt-XL-2-1024-MS

huggingface-cli download sayakpaul/coco-30-val-2014 --repo-type dataset

huggingface-cli download openai/clip-vit-base-patch16
huggingface-cli download openai/clip-vit-base-patch32
huggingface-cli download openai/clip-vit-large-patch14-336
huggingface-cli download openai/clip-vit-large-patch14

