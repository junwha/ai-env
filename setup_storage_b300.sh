#!/bin/bash
# B300 boxes hold multi-TB models/images -> keep them off the boot disk, on /raid.
#   - Docker images  -> /raid/.docker  (daemon data-root)
#   - HF / pip caches -> /raid/.cache   (~/.cache mirrored there)
# Run this BEFORE install_docker.sh so `nvidia-ctk runtime configure` merges the
# nvidia runtime into the daemon.json we write here (it preserves existing keys).

sudo mkdir -p /raid/.docker /raid/.cache

# --- Docker images on /raid ---
sudo mkdir -p /etc/docker
echo '{ "data-root": "/raid/.docker" }' | sudo tee /etc/docker/daemon.json > /dev/null

# --- Mirror ~/.cache onto /raid/.cache (HF hub, pip, etc. default to ~/.cache) ---
if [ -e "$HOME/.cache" ] && [ ! -L "$HOME/.cache" ]; then
    rsync -a "$HOME/.cache/" /raid/.cache/
    mv "$HOME/.cache" "$HOME/.cache.bak.$$"
fi
ln -sfn /raid/.cache "$HOME/.cache"

# --- Belt-and-suspenders env for non-interactive shells ---
if ! grep -q 'HF_HOME=/raid/.cache' ~/.bashrc; then
cat >> ~/.bashrc <<'EOF'
# B300 storage: caches on /raid
export HF_HOME=/raid/.cache/huggingface
export HF_HUB_CACHE=/raid/.cache/huggingface/hub
export PIP_CACHE_DIR=/raid/.cache/pip
export HF_HUB_ENABLE_HF_TRANSFER=1
EOF
fi
