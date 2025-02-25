#!/bin/bash
DOWNLOAD_DIR=$1
cd $DOWNLOAD_DIR

alias apt-get="$(which apt-get) -y"

# Basic tools
apt -y update
apt -y install apt-utils apt-transport-https apt-transport-https ca-certificates curl software-properites-common
apt-get install gcc g++ clang vim git binutils cmake wget bison ninja-build build-essential autoconf libtool libtool-bin automake nasm wget flex bison unzip tar
apt-get install python3-pip virtualenv python3-setuptools

# For X11
apt-get install -y mesa-utils x11-apps
apt-get install -y freeglut3-dev libglu1-mesa-dev mesa-common-dev libxkbfile-dev libgl1-mesa-glx

# Additional Utils
apt-get install ssh openssh-server
apt-get install x11 samba
apt-get install tmux htop vim
