#!/bin/bash
DOWNLOAD_DIR=$1
cd $DOWNLOAD_DIR

export DEBIAN_FRONTEND=noninteractive

# Init
sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install cmake
sudo apt-get -y install ssh
sudo systemctl start ssh
sudo apt-get -y install libedit-dev
sudo apt-get -y install htop
sudo apt-get -y install exuberant-ctags
sudo apt-get -y install swig
sudo apt-get -y install cscope
sudo apt-get -y install tmux
sudo apt-get -y install vim
sudo apt-get -y install tree
sudo apt-get -y install zsh
sudo apt-get -y install texlive-full
sudo apt-get -y install texmaker
sudo apt-get -y install terminator
sudo apt-get -y install g++
sudo apt-get -y install ninja-build
sudo apt-get -y install clang
sudo apt-get -y install tomcat8 tomcat8-admin exuberant-ctags
sudo apt-get -y install python-pip
sudo apt-get -y install python3-pip
sudo apt-get -y install libgcrypt20-dev
sudo apt-get -y install i3
sudo apt-get -y install arandr
sudo apt-get -y install pavucontrol
# install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io
# for google test suite
sudo apt-get -y install gawk
sudo apt-get -y install build-essential
sudo apt-get -y install libxml2-dev
sudo apt-get -y install libssl-dev
sudo apt-get -y install python-dev
sudo apt-get -y install autoconf libtool automake
sudo apt-get -y install subversion
sudo apt-get -y install libbz2-dev
sudo apt-get -y install liblzma-dev
sudo apt-get -y install golang
sudo apt-get -y install ragel
sudo apt-get -y install libgss-dev
sudo apt-get -y install autoconf-archive
sudo apt-get -y install git virtualenv build-essential python3-dev libdbus-glib-1-dev libgirepository1.0-dev
sudo apt-get -y install libreadline-dev
sudo apt-get -y install nasm
sudo apt-get -y install libarchive-dev
sudo apt-get -y install linux-tools-common
sudo apt-get -y install linux-tools-generic
sudo apt-get -y install linux-cloud-tools-generic
#sudo apt-get -y install connman

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
apt-get install -y tmux htop vim xclip
apt-get install -y nano less tree net-tools lsof man-db zip screen rsync apt-offline gnupg iproute2 ncdu gdb ripgrep bash-completion

