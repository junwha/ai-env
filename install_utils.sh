#!/bin/bash
DOWNLOAD_DIR=$1
cd $DOWNLOAD_DIR

export DEBIAN_FRONTEND=noninteractive

# Basic tools
apt -y update
apt list --upgradable
apt -y install apt-utils apt-transport-https apt-transport-https ca-certificates curl software-properties-common
apt-get install -y gcc g++ clang vim git binutils cmake wget bison ninja-build build-essential autoconf libtool libtool-bin automake nasm wget flex bison unzip tar sudo
apt-get install -y python3-pip virtualenv python3-setuptools 

# For X11
apt-get install -y mesa-utils x11-apps
apt-get install -y freeglut3-dev libglu1-mesa-dev mesa-common-dev libxkbfile-dev libgl1-mesa-glx*

# Additional Utils
apt-get install -y ssh openssh-server
apt-get install -y samba
apt-get install -y tmux htop vim
apt-get install -y nano less tree net-tools lsof man-db zip screen rsync apt-offline gnupg iproute2 ncdu gdb ripgrep bash-completion
