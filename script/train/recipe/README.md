# Training recipes

A recipe is one file that describes a training run end-to-end: base model,
adapter, hyperparameters, and how to mix multiple datasets into the training
stream. `train.py` reads the recipe, `mixer.py` builds the mixed HF dataset,
and `run_cpt` / `run_sft` in `cpt.py` / `sft.py` do the training.

For a single-dataset run, keep using `cpt.py` / `sft.py` with their own CLI
flags. Recipes exist for the multi-dataset case.

## Running

Activate the project environment before running a recipe. This also ensures
that notebook kernels, Unsloth, TRL, Transformers, and TensorBoard use the
versions installed for this project rather than packages from the base Python
environment.

```bash
mamba activate <ENV_NAME>
which python

python script/train/train.py \
  --recipe script/train/recipe/<RECIPE_NAME>.yaml
```

To keep a copy of the terminal output:

```bash
python script/train/train.py \
  --recipe script/train/recipe/<RECIPE_NAME>.yaml \
  2>&1 | tee <RECIPE_NAME>.log
```

When debugging an environment mismatch, check the active interpreter and
relevant package versions before changing project dependencies:

```bash
which python

python -c '
from importlib.metadata import version
for package in ["unsloth", "transformers", "trl", "tensorboard", "tensorboardX"]:
    try:
        print(package, version(package))
    except Exception as error:
        print(package, "MISSING", error)
'
```

`--adapter` overrides `recipe.adapter`, `--resume` overrides
`recipe.resume_from`. They're mutually exclusive with each other.

### Resume an interrupted run

Training writes a Trainer checkpoint every `hyperparams.save_steps`. These
checkpoints include adapter weights, optimizer and scheduler state, RNG state,
and the current step. The final `adapter/` directory contains model weights
for inference or a fresh training stage; it is not a resumable Trainer
checkpoint.

List the checkpoints for a run:

```bash
find <RUN_DIR> -maxdepth 1 -type d -name 'checkpoint-*' | sort -V
```

Resume from one of them:

```bash
mamba activate <ENV_NAME>

python script/train/train.py \
  --recipe script/train/recipe/<RECIPE_NAME>.yaml \
  --resume <RUN_DIR>/checkpoint-<CHECKPOINT_STEP>
```

Use `--adapter <ADAPTER_DIR>` instead when intentionally starting a new stage
with fresh optimizer and scheduler state. Merge the old adapter into a new
base model first if the new stage needs different LoRA shape parameters such
as rank or target modules.

## Format

Recipes are YAML (`.yaml` / `.yml`) or Python (`.py` — must export
`RECIPE = {...}` at module level). Both parse to the same dict shape.
The schema is strict: unknown keys are rejected instead of silently falling
back to a default. Start from one of the checked-in recipes when creating a
new one.

```yaml
recipe:
  name: base_sft_v1              # used to name output/adapter/<timestamp>-<name>/
  stage: sft                     # cpt | sft
  base_model: ornith-ai/Ornith-1.5-9B
  adapter: ""                    # optional continue-from adapter path
  hf_repo: ""                    # optional exact repo id; default: <hf_org>/JacLLM-<model-name>
  seed: 3407
  max_seq_length: 4096
  load_in_4bit: true
  text_only: true
  chat_template: qwen-2.5        # sft only

hyperparams:
  epochs: 1
  batch_size: 1
  grad_acc: 10
  lr: 2.0e-4
  lora_rank: 64
  lora_alpha: 16
  # ...any other field in default_config() of cpt.py / sft.py

mixing:
  strategy: interleave           # concat | interleave
  stopping: all_exhausted        # interleave only: first_exhausted | all_exhausted

datasets:
  - task: py2jac                 # required for sft; ignored for cpt
    name: opus-synth-v2          # str | list | "*" (or omit) for all names under task
    split: train                 # default "train"; can also be a list
    weight: 0.20                 # interleave only
    repeat: 1                    # concat oversampling (default 1)
```

## Dataset resolution

Given `stage=sft`:

| entry | resolves to |
|---|---|
| `task=py2jac, name=opus-synth-v2` | `dataset/sft/py2jac/opus-synth-v2/train.jsonl` |
| `task=osp, name=[Nitin-1k-osp]` | one dir |
| `task=js2jac` (no `name`) | every subdir under `dataset/sft/js2jac/` |
| `split=[train, valid]` | both jsonls concatenated into one HF split |

Missing dataset directories or splits are skipped with a visible warning. If
all requested training data is missing, the run stops before loading a model.

Given `stage=cpt`:

| entry | resolves to |
|---|---|
| `name=Nitin-9k-py2jac-idiom` | `dataset/cpt/Nitin-9k-py2jac-idiom/train.jsonl` |
| no `name` | every subdir under `dataset/cpt/` |

## Mixing strategies

**concat** — pack all rows into one dataset, then shuffle. `repeat: 2` in a
dataset entry duplicates that dataset K times before concat (poor-man's
weighting). Every row is seen once per epoch × repeat.

**interleave** — at each training step, sample from a dataset according to
`weight` (normalized to a probability). Small datasets loop when
`stopping: all_exhausted` (default). Every `[[datasets]]` entry needs a
positive `weight`.

Rule of thumb: prefer `concat` when dataset sizes are close and you want each
row seen once; use `interleave` to actively control the ratio (e.g., "farm is
2k rows but I want it at 20% of the mix").

## Overrides

Command-line flags override the recipe:

```
--adapter <path>   # continue from adapter (mutex with --resume)
--resume <ckpt>    # resume training state (mutex with --adapter)
```

## Output

Runs land in `output/adapter/<MM-DD_HH-MM>-<recipe.name>/`. That directory
holds checkpoints, `runs/` (TensorBoard), and `adapter/` (or `merged/` if
`recipe.merge=true`).
