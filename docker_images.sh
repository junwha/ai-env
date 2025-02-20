#!/bin/bash
git clone https://github.com/junwha/DockerSlice

docker pull nvidia/cuda:12.8.0-cudnn-devel-ubuntu22.04
docker pull nvidia/cuda:12.8.0-cudnn-devel-ubuntu24.04
docker pull nvidia/cuda:12.8.0-cudnn-runtime-ubuntu22.04
docker pull nvidia/cuda:12.8.0-cudnn-runtime-ubuntu24.04
docker pull nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04
docker pull nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

docker pull nvcr.io/nvidia/pytorch:24.10-py3

docker pull junwha/cosmos
docker pull junwha/dslice-base-torch:cuda12.4.1-py3.11-torch2.5.0
docker pull junwha/dslice-base-torch:cuda12.4.1-py3.9-torch2.5.0
docker pull junwha/dslice-base-py:cuda12.4.1-py3.11
docker pull junwha/dslice-base-py:cuda12.4.1-py3.9
docker pull junwha/videosys:profiler
docker pull junwha/cogvideo:latest

docker pull pytorch/pytorch:2.6.0-cuda12.6-cudnn9-devel
docker pull pytorch/pytorch:2.6.0-cuda11.8-cudnn9-devel
docker pull pytorch/pytorch:2.5.0-cuda12.1-cudnn9-devel
docker pull pytorch/pytorch:2.5.0-cuda11.8-cudnn9-devel
docker pull pytorch/pytorch:2.4.1-cuda12.1-cudnn9-devel
docker pull pytorch/pytorch:2.4.1-cuda11.8-cudnn9-devel
