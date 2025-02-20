#!/bin/bash
DOWNLOAD_DIR=$1
cd $DOWNLOAD_DIR

git clone https://github.com/lgdd/chatollama
cd chatollama && docker compose up