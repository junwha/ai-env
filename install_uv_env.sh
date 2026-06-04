#!/bin/bash
# uv-based Python 3.13 environment for B300, loaded with as many AI/ML libs as possible.
# Packages are grouped so a wheel that is missing on 3.13 only fails its own group,
# not the whole run. Risky native builds are isolated with `|| true`.
DOWNLOAD_DIR=$1
VENV_DIR=${2:-$DOWNLOAD_DIR/uvenv-py313}

# Keep big wheels/caches on /raid if the storage setup ran
export UV_CACHE_DIR=${UV_CACHE_DIR:-/raid/.cache/uv}

# --- Install uv ---
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.local/bin:$PATH"

# --- Python 3.13 venv ---
uv python install 3.13
uv venv --python 3.13 "$VENV_DIR"
source "$VENV_DIR/bin/activate"

UVPIP="uv pip install --python $VENV_DIR/bin/python"

# --- PyTorch (Blackwell sm_103, cu130) ---
$UVPIP torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu130

# --- Core numerics / data ---
$UVPIP numpy scipy pandas polars pyarrow scikit-learn statsmodels
$UVPIP matplotlib seaborn plotly
$UVPIP xgboost lightgbm catboost

# --- Hugging Face / training stack ---
$UVPIP transformers accelerate datasets tokenizers safetensors huggingface_hub hf_transfer evaluate
$UVPIP peft trl diffusers optimum sentence-transformers
$UVPIP einops timm kornia

# --- NLP / tokenization ---
$UVPIP sentencepiece tiktoken ftfy regex nltk spacy

# --- Vision / audio ---
$UVPIP pillow opencv-python imageio scikit-image
$UVPIP librosa soundfile

# --- Serving / API / app ---
$UVPIP fastapi "uvicorn[standard]" pydantic httpx requests aiohttp
$UVPIP gradio streamlit typer click rich tqdm

# --- Config / orchestration / tuning ---
$UVPIP pyyaml omegaconf hydra-core
$UVPIP optuna ray

# --- Experiment tracking / profiling ---
$UVPIP tensorboard torch_tb_profiler wandb mlflow

# --- Notebook / dev ---
$UVPIP jupyterlab notebook ipython ipywidgets

# --- Risky native builds (isolated so failures don't abort the run) ---
$UVPIP ninja packaging wheel
$UVPIP xformers --index-url https://download.pytorch.org/whl/cu130 || true
$UVPIP flash-attn --no-build-isolation || true
$UVPIP deepspeed || true
$UVPIP bitsandbytes || true
$UVPIP autoawq || true

# --- Inference engines (pin their own torch; isolate to avoid clobbering ours) ---
# Already pulled as docker images in docker_images_b300.sh; pip-installing is optional.
# $UVPIP vllm || true
# $UVPIP "sglang[all]" || true

echo "uv env ready at: $VENV_DIR"
echo "activate with: source $VENV_DIR/bin/activate"
