#!/bin/bash
# RL readiness (Phase 4): train split, n=8, T=0.8 on both v13 SFT adapters.
cd "$(dirname "$0")/../../../.."
eval "$(mamba shell hook --shell bash)"; mamba activate tornith
for A in 0926-v13-B 0926-v13-A; do
  python script/eval/rl/run_eval.py --adapter output/adapter/$A/sft/adapter --split train \
      --n-samples 8 --temperature 0.8 --max-new-tokens 512
done
