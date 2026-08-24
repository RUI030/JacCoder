# JacCoder

JacCoder is a small training workspace for Jac-focused language model work. It currently centers on:

- continual pretraining (CPT) with Unsloth
- local adapter inference
- LoRA merge/export
- dataset storage and preprocessing

The repo is organized so that most day-to-day work happens in three folders:

- `script/`: runnable Python scripts
- `docs/`: notes and reference docs
- `dataset/`: training data and raw source material

## Repo Layout

```text
JacCoder/
├── dataset/
│   ├── CPT/              # text-only training datasets
│   ├── SFT/              # instruction / response datasets
│   └── raw/              # unprocessed source material
├── docs/
│   ├── DATASET.md        # dataset format notes
│   ├── SCRIPT.md         # script notes
│   └── reference/        # notebooks and external references
├── script/
│   ├── train/
│   │   ├── cpt.py        # CPT training entrypoint
│   │   └── sft.py        # reserved for SFT, not implemented yet
│   ├── dataset/
│   │   ├── ds4cpt.py     # reserved for dataset prep, not implemented yet
│   │   ├── statistics.py # reserved for dataset stats, not implemented yet
│   │   └── parser/
│   ├── inference.py      # local chat/inference
│   └── merge_lora.py     # merge LoRA adapter into a standalone model
├── output/               # training outputs and checkpoints
├── requirement.txt
└── setup_env.sh
```

## Setup

### 1. Prerequisites

- Linux with NVIDIA GPU recommended
- `mamba` installed
- Python 3.12
- enough disk space for base models, checkpoints, and merged exports

### 2. Create the environment

From the repo root:

```bash
bash setup_env.sh
```

To use a custom environment name:

```bash
bash setup_env.sh myenv
```

Then activate it:

```bash
mamba activate tornith
```

If you used a custom name, replace `tornith` with that name.

## Dataset Format

### CPT

`script/train/cpt.py` expects JSONL files with a `text` field:

```json
{"text":"training sample"}
```
For more details, please see [`docs/DATASET.md`](docs/DATASET.md).

## How To Use

### Run CPT training

Edit the config block at the top of [`script/train/cpt.py`](script/train/cpt.py) first:

- `BASE_MODEL`
- `ADAPTER_PATH`
- `DATASET`
- `TRAIN_SET`
- `OUT_DIR`
- LoRA and training hyperparameters

Then run:

```bash
python script/train/cpt.py
```

Outputs go into `output/`.

#### Continue training from an existing adapter

Pass `--adapter <path>` (or set `ADAPTER_PATH` in the file) to resume from a prior checkpoint:

```bash
python script/train/cpt.py --ds <dataset> --adapter output/adapter/<run>/adapter
```

**Safe to change** when continuing: `--epochs`, `--lr`, `--steps`, dataset (`--ds`).

**Frozen by the checkpoint** (silently ignored if you pass them): `--rank`, `TARGET_MODULE`, `LORA_ALPHA`, `RSLORA`. These define the adapter's tensor shapes and cannot change mid-life.

To change any shape-affecting param, **merge the adapter into the base first**, then start a fresh run:

1. `python script/merge_lora.py` — merge the old adapter into a standalone model
2. Point `BASE_MODEL` in `cpt.py` at the merged output
3. Run without `--adapter` (from-scratch on top of the merged base) with the new hyperparameters

To see training loss, see
```bash 
tensorboard --logdir path/to/tensorboard
```
under `run` folder in the adapter folder

### Run local inference

Edit the model settings in [`script/inference.py`](script/inference.py):

- `BASE_MODEL`
- `ADAPTER_PATH`
- generation settings such as `MAX_NEW_TOKENS` and `TEMPERATURE`

Then run:

```bash
python script/inference.py
```

This opens a terminal chat loop. Use `/clear` to reset conversation history.

### Merge a LoRA adapter

Edit the config block in [`script/merge_lora.py`](script/merge_lora.py):

- `ADAPTER`
- `Q4bit`
- `max_seq_length`

Then run:

```bash
python script/merge_lora.py
```

Merged outputs are written under `script/merged/` with the adapter folder name.

## Recommended Workflow

1. Prepare or verify a CPT dataset under `dataset/CPT/`.
2. Run `script/train/cpt.py` to produce adapter checkpoints in `output/`.
3. Point `script/inference.py` at a checkpoint and validate behavior.
4. Run `script/merge_lora.py` when you need a merged export.

## Should You Add Bash Wrappers?

Yes, for the stable workflows.

The current scripts are usable, but they require manual edits inside Python files. A thin bash wrapper is worth adding for:

- `train-cpt`
- `chat-local`
- `merge-lora`

The wrapper should only pass arguments and environment variables. Keep the training logic in Python. A good next step is:

```text
script/run/
├── train_cpt.sh
├── inference.sh
└── merge_lora.sh
```

That gives users a stable entrypoint without duplicating logic.

## Related Docs

- [`docs/DATASET.md`](docs/DATASET.md)
- [`docs/SCRIPT.md`](docs/SCRIPT.md)
- [`docs/DEBUG.md`](docs/DEBUG.md)
