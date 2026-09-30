# RL implementation plan

> **Scope:** How to turn [RL.md](RL.md) into code in this repo. This plan starts with a spike on single-function tasks (the **Backend** design in RL.md), stored as `dataset/rl/functions/spike-sample-20/`, and makes sure Multifile, Tool use and Fullstack can be added later without restructuring. The design follows the Unsloth reference notebooks ([gpt-oss GRPO](reference/unsloth_notebook/gpt_oss_(20b)_grpo.py), [Qwen3 GRPO](reference/unsloth_notebook/qwen3_(4b)_grpo.py)) and TRL 0.24's `GRPOTrainer`, adapted to [CONVENTION.md](CONVENTION.md).

> **Built (2026-09-30 spike), divergences from this plan.** Details and numbers: `logs/rl_overnight.md`.
> - **`None` rewards are not ignored by TRL 0.24.** It maps them to NaN and `nansum`s across reward functions, so with the weight-0 metric functions a `None` becomes 0. `infra_error` rows get the mean of their group's valid rewards instead (advantage 0). See [rewards.py](#scriptrlrewardspy).
> - **`harness.materialize(completion, meta)` returns `({target: source}, reason)`** instead of writing into a workdir; the grader owns the workspace (`jac_cli.jac_workspace`). `grade_completion` / `grade_many` live in `rl/graders/__init__.py`, shared by rewards and eval.
> - **Postgres growth is per test block, not per workspace:** `jac test` creates about one database per test block on every run (~50–80 MB per graded sample incl. WAL). `purge_pg()` runs every `purge_pg_steps` (5 in the spike), and `start_pg()` restarts the postmaster outside any per-test cgroup scope.
> - **Thinking off:** Ornith's template opens `<think>` by default and TRL renders prompts without template kwargs, so `grpo.py` defaults `enable_thinking` to false in the in-memory template (matches eval). Answers the open question below.
> - **`script/train/` became a package** (`train.utils`, `train.mixer`), because `script/train/utils.py` shadowed the `script/utils/` package that `rl/` imports.
> - `load_trainable` also calls `utils/model.restore_architectures` (GRPO's `generate()` fails on the Unsloth text-only VLM `architectures = None` bug).
> - Phases ran in the order dataset → grader → plumbing → readiness → spike. `smoke_grpo.yaml` uses 8 generations × 1 group (not 2 × 2) and the whole train split.
> - Extra GRPO keys: `enable_thinking`, `max_grad_norm`, `reward` (`functions` | `constant`), `purge_pg_steps`; meta adds `difficulty` and `forbidden`.
> - **One `meta.json` per set, not per task:** shared fields once, plus `tasks: {<id>: {entrypoints, difficulty}}`; `tasks/<id>/` holds only model-visible files. `rl/task.py:task_meta(task_dir)` merges them.

## What we take from the Unsloth notebook

| Notebook | Here |
|---|---|
| `FastLanguageModel.from_pretrained` + `get_peft_model` | Same loading path as `sft.py`: `model_source(cfg)`, `text_only=True`, and a new LoRA only when there is no adapter |
| Dataset of `{"prompt": [messages], ...}` | Built from `dataset/rl/<task>/<set>/tasks/<id>/` by `rl/task.py`. Extra columns (`task_dir`, `task_type`) reach the reward functions as `**kwargs` |
| Several `reward_funcs` that re-extract and re-execute the code | **Grade once per completion, then read the result from a cache.** One reward function drives training; the others get weight `0` and are logged only (compile rate, format rate) |
| `extract_function` (regex on backticks) | `utils/jac_block.extract_jac_blocks()`; exactly one block is required |
| `create_locked_down_function`, `time_limit`, stdlib-import check | Hidden tests stay out of the workspace, `jac` runs in a temp dir with a timeout and a memory cap, and completions with `test` blocks or Python escape hatches are rejected (see [Reward hacking](#reward-hacking)) |
| `GRPOConfig(num_generations, max_prompt_length, max_completion_length, temperature, ...)` | `default_config()` fields in `train/grpo.py`, set from the recipe `hyperparams` |
| `gc.collect(); torch.cuda.empty_cache()` inside a reward | Not needed: grading runs in `jac` subprocesses, not on the GPU |
| Qwen3 notebook's "pre fine-tune for format" | Our SFT stage already does this. GRPO starts from an SFT adapter |
| `fast_inference=True` (vLLM) | **Not in the spike.** `utils/model.py` sets `fast_inference=False` and vLLM is not pinned. We use HF generation first and try vLLM as a later phase |

## Reuse first

New code is limited to what RL actually adds: loading tasks, materializing a completion, grading with tests, and reward functions. Everything else comes from existing modules. **`script/eval/Nitin-test/` is reference only**, the whole directory: RL code does not import it, copy it, or modify it. Where RL needs the same idea (memory cap, postgres cleanup, pass@k), it is written in the repo's own modules, and Nitin-test stays exactly as it is.

| Need | Reuse | Change needed |
|---|---|---|
| Load model and attach LoRA | The identical block in `cpt.py` and `sft.py` (`from_pretrained(model_source(cfg))` + `get_peft_model` when there is no adapter) | Move it into `train/utils.py` as `load_trainable(cfg)`. Then `cpt.py`, `sft.py` and `grpo.py` each call it (3 callers) |
| Chat-template check | `sft.py` (`chat_template` override, or fail when the tokenizer has none) | Move it into `train/utils.py` next to `load_trainable`, for `sft.py` and `grpo.py` |
| Out dir, GPU banner, save, HF push | `train/utils.py`: `finalize_out_dir`, `print_gpu_banner`, `save_adapter` | `save_adapter`: repo suffix per stage |
| Recipe load, strict schema, mixing, `--resume`/`--adapter`, recipe copy | `train/mixer.py`, `train/train.py` | Add a `grpo` stage (see below) |
| Prompts | `dataset/pipeline.load_prompts` + `template/prompt_template.json` (`system` pool) | New `rl_functions` key |
| Extract the answer | `utils/jac_block.extract_jac_blocks`, `classify_output` | None |
| Run `jac`, run tests, parse results | `utils/jac_cli.invoke`, `jac_tempfile` | Add `jac_workspace`, `check_path`, `test` (per-test results) and a memory cap. These are general `jac` helpers, so they go in `utils/` and the grader stays thin. `gate.py` and later graders can use them too |
| Generate for eval | `utils/model.load_model`, `generate_batched`; the `predictions.jsonl` schema from `eval/infer/` | None |
| Record `meta.class` | `utils/classifier.classify_structural` | None |
| Statistics | `dataset/statistics.py` | Count tasks per split instead of jsonl rows, if it does not fit as-is |

Each new script keeps the repo layout: a `# Setting` block of aligned constants, `# Functions`, a `# Run` or CLI block with `parse_known_args` overrides, and one-line docstrings. Running `grpo.py` and `train.py --recipe` works the same way as for SFT.

## New and changed files

```
dataset/rl/                                   NEW  (checked in: small, hand-written)
└── functions/spike-sample-20/
    ├── meta.json                             shared fields + tasks: {<id>: {entrypoints, difficulty}}
    ├── tasks/<id>/{request.md, starter.jac}
    ├── tests/<id>/{tests.jac, solution.jac}  grader-only; solution.jac is the grader self-test
    ├── splits/{train,dev,test}.txt
    └── statistic.json

script/rl/                                    NEW  domain: the RL environment
├── __init__.py
├── task.py            load a set + split → task dicts → HF Dataset(prompt, task_dir, task_type)
├── harness.py         render prompt; materialize a completion into a workspace dir
├── rewards.py         TRL reward functions, per-step grading cache, thread pool, rollout log
└── graders/
    ├── __init__.py    GRADERS = {"functions": functions.grade}
    ├── functions.py   thin: utils.jac_cli check + test → {status, check_pass, passed, total, reward, ms}
    └── test_functions.py   plain asserts: solution → 1.0, starter → < 1.0, broken → 0

script/train/
├── grpo.py            NEW  default_config() + run_grpo(cfg, train_ds, eval_ds) + single-set CLI
├── train.py           CHG  dispatch stage == "grpo"
├── mixer.py           CHG  stage "grpo": resolve dataset/rl/<task>/<set>, load via rl.task, GRPO keys
├── utils.py           CHG  + load_trainable(cfg), chat-template check (moved from cpt.py/sft.py); save_adapter suffix per stage
├── cpt.py, sft.py     CHG  call load_trainable; no behaviour change
└── recipe/
    ├── dev/smoke_grpo.yaml                   NEW  2 tasks, 2 generations, 5 steps
    └── <MMDD>-grpo-functions-spike/grpo.yaml   NEW  the real spike run

script/eval/rl/
└── run_eval.py        NEW  sample n per task → grade with rl.graders → pass@k + per-task pass counts

script/utils/jac_cli.py                       CHG  + jac_workspace, check_path, test (per-test results), memory cap
script/dataset/template/prompt_template.json  CHG  add "rl_functions" instruction key
docs/{CONVENTION.md, RL.md}, CLAUDE.md,
script/train/recipe/README.md, script/eval/README.md   CHG  document the above
```

**Shape change to call out:** `script/rl/` is a new top-level domain, next to `dataset/`, `train/` and `eval/`. It belongs there, and not in `utils/` or `train/`, because both `train/grpo.py` (rewards) and `eval/rl/run_eval.py` (grading) use it, and it will grow one harness and one grader per task type. `CONVENTION.md` "Where code lives" needs a new row.

## Data flow

```
dataset/rl/<task>/<set>/            (hand-written in the spike; later a producer under script/dataset/rl/)
   │  rl/task.py  load_split(set_dir, "train")
   ▼
HF Dataset {prompt: [system, user], task_dir, task_type}
   │  train/mixer.py (stage: grpo) → train/grpo.py run_grpo
   ▼
GRPOTrainer ── samples num_generations completions per prompt
   │  rl/rewards.py
   │    harness.materialize(completion, task)  → temp workspace/<meta.target>
   │    graders.GRADERS[task_type](workspace, task_dir/../../tests/<id>)
   ▼
reward = 0 if check fails else passed / total   → group z-score → update
   │
   ├─ output/adapter/<MM-DD_HH-MM>-<name>/{checkpoint-N, runs/, adapter/, recipe.yaml}
   └─ output/adapter/<run>/rollouts/step_<N>.jsonl   (completion, status, reward, grade_ms)

eval/rl/run_eval.py → output/eval/rl/<task>/<set>/<tag>_<stamp>/{samples,results}.jsonl, summary.json
```

## Per-file responsibilities

### `dataset/rl/functions/spike-sample-20/`

- 20 problems written by hand, for example 14 train / 3 dev / 3 test. Each problem needs:
  - `request.md` and `starter.jac`, as in RL.md.
  - an entry in the set's `meta.json` (`{"task_type": "functions", "target": "main.jac", "output_format": "jac_block", "forbidden": [...], "tasks": {"add": {"entrypoints": ["add"], "difficulty": "easy"}}}`).
  - `tests/<id>/tests.jac`: hidden tests in the layout described in [Test setup](#test-setup-jac-0361).
  - `tests/<id>/solution.jac`: the reference answer. `test_functions.py` uses it to check that the grader gives it full reward.
- Every task must be covered by a split file. The loader errors on ids that are in no split or in more than one.
- **Leakage guard:** do not reuse Nitin-test problems. When tasks start coming from a producer, dedupe them against `script/eval/Nitin-test/data/function/v1/{clusters.jsonl,denylist_*}`.

### `script/rl/task.py`

- `load_split(set_dir, split) -> list[dict]`: reads `splits/<split>.txt`, then the set's `meta.json` and each task's `request.md` and `starter.jac`. Only the files the model may see, plus `meta`.
- `to_dataset(tasks, prompts) -> Dataset`: builds one row per task. The `prompt` column comes from `harness.render_prompt`; `task_dir` and `task_type` are passed through for the reward functions.
- The model-visible files and `tests/` are kept apart here: nothing under `tests/` is ever read into a prompt.

### `script/rl/harness.py`

- `render_prompt(task, prompts, rng) -> list[dict]`: the system prompt from `prompt_template.json["system"]` (the same pool SFT uses), then a user turn made of the `rl_functions` instruction, `request.md`, and `starter.jac` in a ```` ```jac ```` fence.
- `materialize(completion, task, workdir) -> Path | None`: requires `len(extract_jac_blocks(text)) == 1` and writes the block to `workdir / meta["target"]`. It returns `None` when the format is wrong.
- Multifile will add staging of `files/` and applying changes to several files here. Tool use needs its own rollout loop (see Phase 6).

### `script/rl/graders/functions.py`

The grader only holds the task's scoring rules. Running `jac` and parsing its output live in `utils/jac_cli.py`.

- `grade(workspace, tests_dir, timeout) -> dict`:
  1. `jac_cli.check_path` on the target. On failure: `status=check_fail`, `reward=0`.
  2. Copy `tests.jac` into the workspace and call `jac_cli.test`, which returns `{name: passed}`. Keep only the hidden test names, so `reward = passed / total` (see [Test setup](#test-setup-jac-0361)).
  3. Report `status ∈ {format_fail, check_fail, test_fail, pass, timeout, infra_error}`. `infra_error` must not be scored as `0` (see rewards).
- All calls to `jac` go through `utils/jac_cli.py`, as CLAUDE.md requires.

### `script/utils/jac_cli.py` (changed)

These are general `jac` helpers, not RL-specific, so they go here instead of in `rl/graders/`. Add or change `utils/` helpers like this whenever a grader needs something `jac`-related.

- `jac_workspace(files: dict[str, str])`: a context manager that writes several files into a temp dir and removes it afterwards. It generalizes `jac_tempfile`, which writes one file, and will serve Multifile too.
- `check_path(path, cwd)`: the existing `check(source)` writes its own temp file; RL grades a workspace that already exists.
- `test(path, cwd, timeout) -> (ok, {name: passed}, detail)`: runs `jac test <path> -v` with `JAC_TEST_JOBS=0` and parses the per-test lines. Parsing lives next to the command, so a change in `jac`'s output format only affects this file.
- In `invoke`: process-group kill on timeout, a memory cap (cgroup scope, else RSS watchdog), and `purge_pg()`. See [Runaway protection](#runaway-protection). `gate.py` benefits too, since it runs model code through the same `invoke`.

### `script/rl/rewards.py`

- `make_reward_funcs(cfg) -> (funcs, weights)`:
  - `functions_reward`: weight 1. Implements RL.md's `0 | passed/total`.
  - `compile_rate`, `format_rate`: weight 0. TRL still logs each reward function's mean and std, which gives the spike metrics for free.
- **Grading cache:** TRL calls each reward function separately on the same batch. The first call grades every `(task_id, sha(completion))` with a `ThreadPoolExecutor` (grading is subprocess-bound); later calls read the cache.
- **`infra_error` / `timeout`:** these return `None`. TRL 0.24 ignores `None` rewards through a NaN-aware mean, so a grading crash doesn't count as a model failure. Check this in Phase 1. *(Checked: it does not. `nansum` across reward functions turns `None` into 0, so `infra_error` gets the group mean; `timeout` scores 0.)*
- **Rollout log:** writes `rollouts/step_<N>.jsonl` with the prompt id, completion, status, reward, `grade_ms` and group index. This covers RL.md's "reward variation within groups" and "grading time", and makes reward hacking visible.

### `script/train/grpo.py`

This file mirrors `sft.py`:

- **Module import order:** `from unsloth import FastLanguageModel` must come before `from trl import GRPOConfig, GRPOTrainer`, because Unsloth patches TRL's GRPO on import.
- **`default_config()`:**
  - **Shared keys:** the same model, output and LoRA keys as `sft.py`.
  - **GRPO keys:** `num_generations: 8`, `temperature: 0.8`, `top_p: 1.0`, `max_prompt_length`, `max_completion_length`, `beta: 0.0`, `loss_type`, `importance_sampling_level: "token"`, `epsilon`, `scale_rewards`, `mask_truncated_completions: True`, `grade_timeout`, `grade_workers`, `log_completions`.
  - **Groups per step:** TRL 0.24 has no separate "number of groups" key. `num_generations` is the group size (8). Each optimizer step generates `batch_size × grad_acc` completions (`generation_batch_size`, which must be divisible by `num_generations`), so groups per step = `batch_size × grad_acc / 8`. For example, `batch_size: 2, grad_acc: 8` gives 16 completions, which is 2 prompts × 8. `batch_size` counts completions, not prompts.
  - **Explicit defaults:** set every key TRL would otherwise default. That way a TRL upgrade can't silently change a run.
- **`run_grpo(config, train_ds, eval_ds=None)`:**
  1. `load_trainable(cfg)` and the shared chat-template check from `train/utils.py`.
  2. Build `GRPOConfig` with aligned keyword arguments.
  3. Build `GRPOTrainer(model, processing_class=tokenizer, reward_funcs, reward_weights, args, train_dataset)`.
  4. Call `trainer.train(resume_from_checkpoint=...)`, then `save_adapter(..., stage="grpo")`.
- **`__main__` CLI:** `--task functions --ds spike-sample-20 --steps N --adapter <sft adapter>`, following `config_from_cli()` in `sft.py`.
- **Reference model:** keep `beta: 0.0` in the spike. With PEFT, TRL computes reference log-probs by *disabling the adapter*. When starting from an SFT adapter, that makes the reference the **pre-SFT base**, not the SFT policy. If KL is wanted later, merge the SFT adapter first with `merge_lora.py`, into 16-bit for the MoE model per CLAUDE.md, then put a fresh LoRA on top.

### `script/train/mixer.py` and `train.py` (changed)

- `stage` accepts `"grpo"`. `resolve_names` maps it to `dataset/rl/<task>/<set>`, and `entry_datasets` loads it through `rl.task` rather than reading jsonl.
- GRPO keys are allowed only when `stage: grpo`: a per-stage key set, so the strict schema stays strict. `TRAIN_COLUMNS` gains `prompt`, `task_dir` and `task_type`.
- The mixing strategies (`concat` / `interleave` / `sequential`) work unchanged over task rows. `train.py` just gets one more `elif stage == "grpo"` branch.

### `script/eval/rl/run_eval.py`

- CLI in the style of `Nitin-test/run_eval.py`: `--adapter`, `--set`, `--split dev|test`, `--n-samples`, `--temperature`, `--k`, `--limit`, `--workers`.
- The flow is the same as the other eval scripts: generate with `utils/model.load_model` + `generate_batched` into `predictions.jsonl` (the `eval/infer/` schema plus `sample_id`), then grade with `rl.harness` and `rl.graders`. Training and eval use the same grading path.
- `summary.json` holds pass@k (the unbiased estimator, a few lines in this script, not imported from Nitin-test), compile rate, and **per-task pass counts out of n**.
- **RL-readiness mode:** `--split train --n-samples 8 --temperature 0.8`. It reports the fraction of tasks with `0 < passes < 8`. Only those tasks give a GRPO signal (RL.md: an all-fail group has no signal). An optional `--emit-split` writes those task ids to `splits/train_active.txt`.

## Test setup (jac 0.36.1)

Checked with the jac-testing guide, `jac guide reference/testing` and a local run. The jac MCP server was not connected in this session; `jac guide` serves the same reference.

- **Layout:** the candidate is `main.jac`. The hidden tests are `tests.jac` beside it, starting with `import from main { <entrypoints> }`, followed by named blocks:

  ```jac
  import from main { add }

  test "adds small" { assert add(2, 3) == 5; }
  test "adds negative" { assert add(-1, 1) == 0; }
  ```

  Don't name the file `test_*.jac`, which clashes with Python's test-module import. A `main.test.jac` annex also works and can see private declarations, but the `import from` form keeps the tests' view of the candidate to what `meta.entrypoints` exports. Nitin's grader uses the same form.
- **Run:** `JAC_TEST_JOBS=0 jac test tests.jac -v`, from the workspace dir.
  - **Why serial:** by default `jac test` starts one pytest-xdist worker per core (32 here). The same 3-test file took 4.8 s in parallel and 1.4 s serial. The reward function already runs graders in parallel.
- **Per-test result:** `jac test` runs on pytest in 0.36.1 (the "Test Output" section of `jac guide` still shows the older unittest format). Each hidden test appears in the `-v` output as a `tests.jac::<name> PASSED` or `FAILED tests.jac::<name>` line, so a single run gives `passed / total` and there's no need for one process per test. The exit code is non-zero whenever any test fails.
- **Counting:** count only the names declared in `tests.jac`. With `import from main`, a `test` block written by the model inside `main.jac` still shows up in the run (checked: an extra always-true `test "sneaky"` block was reported as `tests.jac::sneaky PASSED`). Rejecting test blocks at format time is the first guard; counting only hidden names is the second.
- **Codespace:** also write `jac.toml` with `[build]\ndefault_codespace = "server"` into the workspace, as Nitin's grader does. This skips the native-lowering attempt behind the notes below.
- **State:** function tasks don't touch `root`. If a later task uses graph state, each workspace is a fresh temp dir, so `.jac/data` doesn't persist between graded samples.
- **Noise:** without that `jac.toml`, `jac test` prints `preferred native but did not lower` notes for plain functions. Either way, the parser should read only the per-test lines and the summary line.
- **Verdicts:** besides `PASSED` / `FAILED`, there is `ERROR tests.jac - ...` (for example, the import failed). That gives no verdict for any hidden test, so the task scores `0`, not an infra error. The error text still goes into the rollout log.

## Runaway protection

A policy mid-training *will* write infinite loops and unbounded allocations, and the grader runs up to `batch × num_generations` of them at once, on the same host as the training process. These are the lessons already recorded in [CLOUD_GPU.md](CLOUD_GPU.md) ("Nitin function tests on a container") and [Nitin-test/PROVENANCE.md](../script/eval/Nitin-test/PROVENANCE.md) (memory-cap patch). They are reimplemented in `utils/jac_cli.py`. Nitin-test is only a reference and is left unchanged.

| Hazard | Recorded fix | In `jac_cli` |
|---|---|---|
| Infinite loop | Timeout that kills the whole **process group**; a spawned child dies with it | `invoke` starts each `jac` with `start_new_session=True` and calls `os.killpg(SIGKILL)` on timeout. Today's `subprocess.run(timeout=...)` kills only the direct child |
| Runaway allocation | Per-test cgroup via `systemd-run --user --scope` (`MemoryMax`, `MemorySwapMax=0`, `OOMPolicy=kill`) when a one-time probe succeeds. Otherwise an RSS watchdog: sum the group's RSS from `/proc` every 0.5 s and SIGKILL it when over the cap | Same two paths behind a `mem_limit_bytes` argument. The result is labelled `memory_cap` |
| `RLIMIT_AS` as the cap | **Rejected:** jac reserves enough virtual memory that a 12 GB cap fails `start_new_thread` on correct solutions | Not used |
| xdist fan-out | `-n auto` gave 128 workers, about 30 GB and 40 s for one correct sample. The embedded postgres also caps clients at 64 (`too many clients already`) | `JAC_TEST_JOBS=0` (see [Test setup](#test-setup-jac-0361)). `too many clients` is treated as `infra_error` |
| Embedded postgres | Daemonizes out of the process group, so the cap doesn't see it. Its data dir once grew to 1.1 TB | `jac_cli.purge_pg()`, our own version of the approach in `grade_stream.py` (`pg_ctl stop -m fast` + wipe `~/.cache/jac/pg/main`). `rl/rewards.py` calls it every N steps and at the end of the run |
| Root on containers | postgres `initdb` refuses root, so every test errors | Run as `jacgrader` per CLOUD_GPU.md. The grader self-test fails loudly if every sample is `infra_error` |
| `/dev/shm` | Mounted `noexec`, so `initdb` gets `Permission denied` | Keep the workspace temp dirs and `~/.cache/jac` off `/dev/shm` |

Scoring:

- `timeout` and `memory_cap` get reward `0`. The model caused them.
- `infra_error` (launch failure, postgres client limit, `initdb`) gets `None`, so it doesn't penalize the model. `rewards.py` logs the infra-error rate, and a run whose rate stays high should stop and not keep training on noise.

Budget:

- `grade_workers × grade_mem_gb` has to fit in host RAM next to the training process. Both are `default_config()` keys, set from the recipe.
- Start with `grade_workers=4`, `grade_mem_gb=4` and `grade_timeout=30`, then adjust from the readiness measurements in Phase 3.

## Reward hacking

These checks map the notebook's list to Jac:

| Risk | Guard |
|---|---|
| Reading or editing the tests | Tests live in `tests/<id>/` and are copied in only after the completion is written. A completion containing a `test "…"` block gets `format_fail` (the same idea as Nitin's `no_test_blocks` feature): `jac test` also collects test blocks from imported modules, so the model's own tests would otherwise count as passes. |
| Hard-coding the public examples | Hidden tests use different inputs from `request.md`. Each task needs more than one hidden test. |
| Laziness or escapes (Python interop, `os`, `subprocess`) | Reject `import:py` or the Python-import forms the task forbids, via a per-task `meta.forbidden` list checked before running |
| Infinite loops or memory blow-up | See [Runaway protection](#runaway-protection). |
| Stubbing everything so it compiles | Compiling alone earns `0`. Only passing tests earn reward. |
| Grader bugs mistaken for learning | `test_functions.py` must pass before every run. Spot-check `rollouts/` for high-reward samples. |

## Phases

Each phase ends with a check before the next one starts.

1. **Plumbing smoke:** `grpo.py`, the `train.py` and `mixer.py` changes, and `dev/smoke_grpo.yaml` with a constant dummy reward. Run 5 steps on Ornith with `text_only=True` and its native chat template. *Check:* the loss and logs appear, the adapter saves, and it reloads through `load_model`. This is where problems with the VLM wrapper and `GRPOTrainer` would show up.
2. **Grader:** write the 20 `dataset/rl/functions/spike-sample-20/` tasks, `harness.py`, `graders/functions.py`, the `jac_cli` changes and `test_functions.py`. *Check:* all solutions get 1.0, all starters get less than 1, and per-test counts match a manual run of `jac test`. Also plant three runaway candidates, as CLOUD_GPU.md did: an infinite loop must end as `timeout`, a huge allocation as `memory_cap`, and a spawned child process must be killed with the group. Run the planted cases with several graders in parallel, and watch host RAM and the size of `~/.cache/jac/pg` while they run.
3. **Readiness:** run `eval/rl/run_eval.py --split train --n-samples 8` on the best SFT adapter. *Check:* enough tasks have mixed results, and grading time per group is known. Use this to set `grade_workers` and the step time budget.
4. **Spike run:** `recipe/<MMDD>-grpo-functions-spike/grpo.yaml` with 8 generations, temperature 0.8 and a few hundred steps. Track reward, compile rate and the fraction of zero-std groups in TensorBoard. Afterwards, run `run_eval.py --split dev` against the SFT adapter.
5. **GSPO comparison:** the same recipe with `importance_sampling_level: sequence`, for Ornith and for the Qwen3-Coder MoE. Keep in mind that expert-LoRA adapters stay unmerged in `load_model`.
6. **Later:**
   - **Generation speed:** try vLLM (`fast_inference=True`) once the loop works. This needs a vLLM pin and has to be checked against the Ornith VLM wrapper.
   - **Multifile:** a new `graders/multifile.py` and `files/` staging in `harness.py`.
   - **Fullstack:** `graders/fullstack.py`, which uses `jac_cli.start_http_check`.
   - **Tool use:** needs a multi-turn rollout loop that TRL 0.24's `GRPOTrainer` does not provide as-is. Look into it separately before committing to it.
   - **Dataset producer:** `script/dataset/rl/<task>.py`, which writes task directories with the usual Setting / Functions / Run banners.

## Open questions

- **Ornith thinking mode** *(answered: yes by default; the spike trains with thinking off, like eval)*: does its native template emit a reasoning block before the answer? If so, `max_completion_length` has to leave room for it, and the format rule has to allow text outside the single ```` ```jac ```` block.
- **Where tasks come from after the spike:** jac-data-gen masters that ship tests? They would need deduping against Nitin-test first.
