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
