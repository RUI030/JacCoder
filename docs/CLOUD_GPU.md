# Cloud GPU guide (RunPod)

Lessons from bringing up Qwen3-Coder-30B-A3B training and eval on a RunPod
RTX PRO 6000 Blackwell (96GB, driver 595 / CUDA 13.2, 200GB `/workspace`
network volume). Each item is symptom → cause → fix.


## Storage: what survives a restart

| Survives (`/workspace`, network volume) | Lost on pod reset (container disk, ~30GB) |
|---|---|
| repo, `output/`, HF cache (`HF_HOME=/workspace/.cache/huggingface`) | conda env in `/root/miniforge3/envs/` |
| `/workspace/bin/jac`, `/workspace/llama.cpp` | `~/.local/bin`, `~/.bashrc` (PATH, `HF_TOKEN`) |
| | page cache (model shards in RAM) |

Restart checklist:

```bash
PATH=/root/miniforge3/bin:$PATH TORCH_BACKEND=cu130 bash setup_env.sh jacllm   # if env is gone (~5 min)
mkdir -p ~/.local/bin && ln -sf /workspace/bin/jac ~/.local/bin/jac               # jac on PATH
export HF_TOKEN=...                                                              # write-scoped, see below
```

Keep secrets out of files you might `cat` or share: `~/.bashrc` holds
`HF_TOKEN` in plain text.


## Environment setup

- **`mamba` not found.** RunPod's miniforge lives at `/root/miniforge3` but is
  not on PATH. `setup_env.sh` falls back to `$HOME/miniforge3/bin/mamba`.
- **Env path garbage / exit 127.** mamba 2.x prints `base environment : <path>`
  for `mamba info --base`; `setup_env.sh` strips the label.
- **CPU-only torch installed (`torch==2.11.0+cpu`, `torchvision==0.2.0`).**
  Unsloth caps `torch<2.12`. On CUDA 13.2 drivers `uv --torch-backend=auto`
  picks the cu132 index, which has no build under that cap, and uv silently
  falls back to a CPU wheel. Fix: `TORCH_BACKEND=cu130 bash setup_env.sh`.
  Check with `python -c "import torch; print(torch.__version__, torch.cuda.is_available())"`.
- **`jac` for eval.** The pinned toolchain (`jac 0.36.1`) is not on PyPI
  (`jaclang` tops out at 0.16.x). Install with
  `curl -fsSL https://raw.githubusercontent.com/jaseci-labs/jaseci/main/scripts/install.sh | bash -s -- --version 0.36.1`,
  then move the single binary to `/workspace/bin/jac` and symlink it. It
  unpacks a runtime into `~/.cache/jac/` on first run (~10s), re-done after a
  restart automatically.


## Hugging Face

- **Downloads crawl (~5MB/s).** Unauthenticated requests are throttled; set
  `HF_TOKEN` before the first download.
- **`403 ... rights to create a model under the namespace "jaseci"`.** A
  fine-grained token scoped only to your user can't create org repos even if
  your account can. Use a write token (or add the org to the fine-grained
  scopes). `HF_TOKEN` overrides the stored `$HF_HOME/token`; check what a
  token can do with `HfApi().whoami(token)["auth"]`.
- Push adapters with `hf upload <org>/<repo> <adapter_dir> . --private`
  (`adapter/` only; checkpoints are for resuming, not sharing).


## Loading 30B weights from the network volume

- **Loading takes 30+ min (~4s per shard).** Reads from `/workspace` are slow
  one file at a time. Prefetch in parallel into page cache first (57GB in
  ~95s):

  ```bash
  ls $HF_HOME/hub/models--unsloth--qwen3-coder-30b-a3b-instruct/snapshots/*/*.safetensors \
    | xargs -P 16 -I{} cat {} > /dev/null
  ```

  The host is shared, so the cache gets evicted between runs; prefetch again
  if a load is slow.
- **bf16 load of the 30B MoE** reached 59GB VRAM at 13% loaded. Use
  `load_in_4bit: true` (~17GB).
- **Host RAM during load** peaks at ~52GB (bf16 shards quantized on the fly);
  training itself uses ~3.5GB. Plan for this on unified-memory machines.


## Long runs

- Launch detached so a dropped session doesn't kill training:
  `setsid nohup bash -ic '<python ...>' > logs/<run>.log 2>&1 < /dev/null & disown`.
- **`pkill -f <pattern>` killed my own shell** (the pattern was in its command
  line). Stop jobs by PID: `ps -eo pid,args | grep "[p]ython script/train/train.py"`.
- `script/monitor.sh logs/usage.csv 30` logs GPU/VRAM/CPU/RAM. `free` inside
  the container reports the whole host; use the `train_rss_gb` column.


## Disk budget (r64 LoRA on Qwen3-Coder-30B-A3B)

| Item | Size |
|---|---|
| base model in HF cache | 57GB |
| adapter (`adapter_model.safetensors`, fp32) | 9.6GB |
| checkpoint (adapter + optimizer state) | 15GB |
| merged 16-bit model | ~61GB |

Checkpoints every `save_steps` fill 200GB fast: set
`hyperparams.save_total_limit: 2`. Saving a checkpoint also spikes host RAM
by ~9.5GB (safetensors builds the file in memory).


## Training pitfalls found on this run

- **`sequential` mixing was silently shuffled.** HF `Trainer` defaults to a
  `RandomSampler`; the mixer now sets `train_sampling_strategy="sequential"`.
  Runs before commit `31da523` were effectively concat.
- **Packed SFT trained on system prompts.** `train_on_responses_only` runs after
  packing and unmasks from an assistant marker to the next user marker, which
  spans the next conversation's system prompt. `sft.py` now builds labels per
  conversation before packing (commit `4599fa7`). Unsloth drops an
  `assistant_masks` column for pre-tokenized data, so the mask travels as
  `labels`.
- **Packing is worth it for short SFT data:** ~80 min vs ~6.5h (median sample
  211 tokens), GPU 95% vs 66%. Use `grad_acc: 1` to keep ~10 samples/update.
- **CPT → SFT via `adapter:`** keeps the CPT LoRA shape (alpha 32 here, the SFT
  recipe's 16 is ignored). Resuming such a run needs `adapter: ""` *and*
  `lora_alpha: 32`, or the checkpoint loads at the wrong scale.
- Verify continuation with weights, not the trainable-param count: `lora_A`
  cosine vs the CPT adapter should be ~1 at the first SFT checkpoint.


## Eval pitfalls

- **Merged 4-bit MoE model = base model.** `merge_and_unload()` on the 4-bit
  Qwen3-MoE base generated exactly like the base (code_gen answered in
  JSX/Python). `load_model` now keeps adapters with `target_parameters`
  (expert LoRA) unmerged (commit `c44edd6`). Sanity-check any new model with
  adapter on / `disable_adapter()` / merged on a *training* prompt.
- **Unmerged HF generation is slow** (~30s/sample at batch 4). Raise
  `python script/eval/batch.py --batch-size 16`, or export to GGUF (below).
- **GGUF / llama.cpp (in progress).** Build on Blackwell:
  `cmake -B build -DGGML_CUDA=ON -DCMAKE_CUDA_ARCHITECTURES=120 -DLLAMA_CURL=OFF`.
  `convert_hf_to_gguf.py` runs in the `jacllm` env with
  `PYTHONPATH=gguf-py` (skip its requirements file, which pins torch). Serve
  with `llama-server` and point `script/eval/infer/openrouter.py --base-url
  http://127.0.0.1:8080/v1` at it. Merge to 16-bit first
  (`save_pretrained_merged(..., "merged_16bit")`), not into the 4-bit model.
