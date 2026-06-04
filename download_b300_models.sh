#!/bin/bash
# All three are open (ungated) models -> no HF token required to download.
# Passing a token is OPTIONAL; it only raises rate limits for multi-TB pulls.
TOKEN=$1

export HF_HOME=/raid/.cache/huggingface
export HF_HUB_CACHE=/raid/.cache/huggingface/hub
export HF_HUB_ENABLE_HF_TRANSFER=1

pip install -U "huggingface_hub[cli]" hf_transfer

# Optional auth: only log in if a token was provided
if [ -n "$TOKEN" ]; then
    huggingface-cli login --token "$TOKEN"
fi

# --- GLM-5.1: official BF16 + official FP8 (download both, BF16 first) ---
huggingface-cli download zai-org/GLM-5.1        # BF16 full weights
huggingface-cli download zai-org/GLM-5.1-FP8    # native FP8, fastest throughput on B300

# --- Kimi-K2.6: ships natively in INT4; no official FP16/FP8 variant ---
huggingface-cli download moonshotai/Kimi-K2.6   # native INT4 (only official weights)
# Community FP8 build (RedHat, vLLM-tested) -- uncomment if you want an FP8 Kimi:
# huggingface-cli download RedHatAI/Kimi-K2.6-FP8-BLOCK

# --- MiMo-V2.5-Pro: single repo, already FP8-native (no separate FP16/FP8 repos) ---
huggingface-cli download XiaomiMiMo/MiMo-V2.5-Pro
