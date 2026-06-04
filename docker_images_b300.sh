#!/bin/bash

# Recent 3 vLLM serving images (CUDA 12.9, Blackwell-ready)
docker pull vllm/vllm-openai:v0.22.0-cu129-ubuntu2404
docker pull vllm/vllm-openai:v0.21.0-cu129-ubuntu2404
docker pull vllm/vllm-openai:v0.20.2-cu129-ubuntu2404

# Recent 3 SGLang serving images (CUDA 13.0, Blackwell-ready)
docker pull lmsysorg/sglang:v0.5.12.post1-cu130
docker pull lmsysorg/sglang:v0.5.12-cu130
docker pull lmsysorg/sglang:v0.5.11-cu130
docker pull astrasim/tutorial-micro2024

docker pull pytorch/pytorch:2.12.0-cuda13.0-cudnn9-runtime
docker pull nvcr.io/nvidia/pytorch:25.11-py3
docker pull nvcr.io/nvidia/pytorch:26.01-py3
docker pull nvcr.io/nvidia/pytorch:26.03-py3
docker pull nvcr.io/nvidia/pytorch:26.05-py3
