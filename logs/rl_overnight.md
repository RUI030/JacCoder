# RL spike overnight log (2026-09-29 → 09-30)

Branch `rl-spike`. Spec: `docs/RL_Implementation_plan.md`, `docs/RL.md`.
Host: RTX 5080 16 GB, 61 GB RAM, 32 cores, jac 0.36.1, env `tornith` (trl 0.24.0, unsloth 2026.8.19, transformers 5.5.0).

Answers given before start: purge `~/.cache/jac/pg` freely; host dedicated overnight;
format rule = any prose allowed, exactly one ```` ```jac ```` block.

## TODO (checklist, kept current)

- [x] P1 dataset: 20 tasks, validate solutions/starters, statistic.json, commit
- [x] P2 jac_cli: jac_workspace, check_path, test (per-test), invoke w/ pgroup kill + mem cap (cgroup / RSS watchdog), purge_pg
- [x] P2 script/rl: task.py, harness.py (render_prompt, materialize, forbidden/test-block guard), graders/functions.py, graders/test_functions.py
- [x] P2 prompt_template.json: rl_functions key
- [x] P2 checks: solutions 1.0, starters <1, broken 0, test-block rejected, loop→timeout, alloc→memory_cap, child killed; 4–8 parallel; log RAM + pg size; commit
- [x] P3 load_trainable + chat-template check in train/utils.py; cpt/sft use it; smoke SFT max_steps=2
- [x] P3 train/grpo.py, rl/rewards.py (cache, pool, None on infra_error, rollouts log, purge_pg every N), mixer/train.py grpo stage, smoke_grpo.yaml
- [x] P3 5 steps dummy reward, 5 steps real reward; save + reload via load_model; log step time + fitting settings; commit
- [x] P4 script/eval/rl/run_eval.py; readiness on v13-B and v13-A (pass@1/8, compile, mixed frac, grade time); pick adapter; ≤2 difficulty rounds; set grade_*; commit
- [ ] P5 spike recipe; nohup launch + tee; monitor (reward, compile, zero-std, infra err, RAM, pg size); dev eval final vs base; reward-hacking spot-check; commit
- [ ] P6 GSPO (if time before 07:30)
- [ ] P7 docs: CONVENTION, CLAUDE.md, recipe README, eval README, plan divergences; summary at top of this log; commit

## Phase 1: spike dataset — done

Built `dataset/rl/functions/spike-sample-20/`: 20 hand-written single-function tasks,
14 train / 3 dev / 3 test, 12 easy / 8 medium, 109 hidden tests (5–7 per task, all
inputs differ from `request.md` examples, edge cases: empty input, negatives,
duplicates, wrap-around, truncation toward zero, input not mutated).

- train: rle_encode, valid_ipv4, word_frequency, dotted_keys, two_sum, roman_to_int,
  merge_intervals, caesar_shift, group_anagrams, balanced_brackets, binary_search,
  count_islands, rotate_matrix, eval_rpn
- dev: int_to_roman, second_largest, compress_ranges
- test: max_subarray, wrap_text, pascal_row

`meta.json` adds `difficulty` and `forbidden` (module names `os sys subprocess shutil
socket pathlib ctypes importlib` and `::py::`) to the plan's keys.

Checks:
- End-to-end on one task first: `jac check` ok; `JAC_TEST_JOBS=0 jac test tests.jac -v` 0.6 s wall, 68 MB max RSS;
  per-test lines `tests.jac::<name with spaces> PASSED|FAILED`, rc=1 on any failure.
- All 20 solutions: `jac check` rc 0 and all hidden tests pass. All 20 starters compile and
  fail ≥1 hidden test (starter pass counts range 0/6 .. 5/7).
- RAM: hidden tests use tiny inputs (largest: a 1000-element list, `pascal_row(30)`), no
  deep recursion, so a correct or naive solution never needs more than the ~70 MB baseline.
- Leakage: grepped Nitin `public/` + clusters for every entrypoint idea (never opened `private/`).
  Dropped/renamed overlapping ideas: palindrome → `valid_ipv4`, list flatten → `dotted_keys`,
  camel/snake case → `wrap_text`, transpose → `rotate_matrix`.

Findings (jac 0.36.1):
- **Without the workspace `jac.toml` (`default_codespace = "server"`), plain functions get lowered
  to native and return garbage** (`merge_intervals` returned `[[895184816, 778313436159518891]]`).
  The grader must always write that `jac.toml`, which the plan already requires.
- **A `lambda` inside a `def` raises `UnboundLocalError: ... '__jac_lambda_1'` at runtime**
  (e.g. `sorted(xs, key=lambda (p: list[int]) { p[0]; })`), in both single-expression and
  explicit-return forms. Solutions avoid lambdas. Completions that use them will score 0 on
  the affected tests, which is correct for this jac version but worth knowing when reading rollouts.

Decision: the task files were written by a scratch generator (not checked in); the files under
`dataset/rl/` are the source of truth, as the plan says ("hand-written").
`statistic.json` counts tasks per split/difficulty and hidden tests (the jsonl-based
`dataset/statistics.py` doesn't fit a task directory).

## Phase 2: grader — done

Built:
- `utils/jac_cli.py`: `JacResult`, `execute()` (own process group, SIGKILL of the group on
  timeout, memory cap = per-call `systemd-run --user --scope` with MemoryMax/MemorySwapMax=0/
  OOMPolicy=kill after a one-time probe, else an RSS watchdog on the group every 0.5 s; no
  RLIMIT_AS), `invoke()` now wraps `execute()` (same `(ok, text)` API, so `gate.py` is
  unchanged and gains the group kill), `jac_workspace(files)`, `check_path`, `test` (per-test
  verdicts from the `-v` lines, `JAC_TEST_JOBS=0`), `INFRA_ERROR`, `SERVER_TOML`,
  `pg_size_bytes`, `purge_pg` (SIGINT the postmaster from `postmaster.pid`, wait, then rmtree
  `~/.cache/jac/pg/main`), `start_pg` (start postgres from the parent with no cap).
- `script/rl/`: `task.py` (`check_splits`, `load_split`, `to_dataset`), `harness.py`
  (`render_prompt`, `completion_text`, `forbidden_hit`, `materialize`), `graders/__init__.py`
  (`GRADERS`, `tests_dir_of`, `grade_completion`, `grade_many`), `graders/functions.py`,
  `graders/test_functions.py`.
- `prompt_template.json`: `rl_functions` key (3 phrasings).

Checks (`python script/rl/graders/test_functions.py --workers 8`, all PASS):
- 20/20 solutions reward 1.0 (grade ≤ 2.0 s each; 20 in 5.4 s on 8 workers).
- 20/20 starters compile and score < 1.0; per-task pass counts are identical to the manual
  `jac test -v | grep` counts from Phase 1 (e.g. valid_ipv4 5/7, eval_rpn 0/6).
- Broken file → `check_fail`, 0. No block / two blocks / own `test` block / `import os` /
  `::py::` → `format_fail`, 0. A closed `<think>` containing a fence + one real block → pass.
- A test block that slips past the screen can't add a pass (only hidden names count).
- Planted runaways, 6 at once (2× each): infinite loop → `timeout` (10 s), `[0] * 10**9` →
  `memory_cap` (1 GB cgroup cap), `subprocess.Popen(["sleep","313"])` + loop → `timeout` and
  no `sleep 313` survives. Also `memory_cap` via the forced RSS-watchdog path.
  12.6 s wall, **peak host RAM 11.8 / 61 GB** (baseline ~8 GB used), scopes available.
- **`~/.cache/jac/pg`: 0 → 3.6 GB over ~57 graded samples** (≈45 MB/sample in `base/` + WAL
  capped near 1 GB).

Findings / decisions:
- **`jac test` creates ~1 database per test block on every run and never drops them**
  (probe: 6 new DBs per run of a 5-test file, same count whether the workspace dir is reused
  or fresh). A jac behaviour, not fixed here. I first tried reusing a fixed dir per grader
  worker (jac names the project DB after the path); it did not bound growth, so it was
  removed. Mitigation = `purge_pg()` between reward batches every N steps (Phase 3).
- `start_pg()` before grading: the first `jac` call starts the shared postmaster, and if that
  call runs inside a per-test cgroup scope, postgres lives in that scope and an OOM kill
  there would take it down for all graders.
- Divergence: `harness.materialize(completion, meta)` returns `({target: source}, reason)`
  instead of writing into a workdir; the grader owns the workspace (`jac_workspace`).
  `grade_completion`/`grade_many` live in `rl/graders/__init__.py` because both
  `rewards.py` and `eval/rl/run_eval.py` call them.
- `infra_error` is only assigned when the infra pattern matches **and** not all hidden tests
  passed, so a model printing "initdb" can at most turn a 0 into `None`, never gain reward.
- The `jac check` timeout path returns `check_fail`/0 (it's static, and a hang there is rare).
- Mistake during probing: a `pg_ctl` glob matched two dist versions (18.4.0, 18.6.0), the stop
  failed, and I removed `pg/main` under a live postmaster; stopped it with SIGINT and wiped.
  `purge_pg` avoids `pg_ctl` for this reason (signals the pid from `postmaster.pid`).

## Phase 3: GRPO plumbing — done

Built:
- `train/utils.py`: `load_trainable(cfg)` (from_pretrained + LoRA only without adapter/resume,
  then `restore_architectures`), `ensure_chat_template(tokenizer, cfg)`; `save_adapter` suffix
  `-sft` / `-grpo` per stage. `cpt.py` and `sft.py` call them (no behaviour change).
- `utils/model.py`: `restore_architectures(model)` extracted from `load_model` (second caller:
  `load_trainable`; GRPO's `generate()` crashed on `config.architectures = None` without it).
- `train/grpo.py`: `default_config()` (every GRPO key TRL would default is explicit),
  `run_grpo(cfg, train_ds, eval_ds)`, single-set CLI (`--task functions --ds spike-sample-20
  --steps N --adapter ...`).
- `rl/rewards.py`: `make_reward_funcs(cfg)` → `functions_reward` (w=1) + `compile_rate`,
  `format_rate`, `pass_rate`, `infra_rate` (w=0, logged as `rewards/<name>/mean`); a `Grader`
  that grades each (task, sha1(completion)) once per step on a thread pool, writes
  `rollouts/step_<N>.jsonl` and `rollouts/stats.jsonl` (grade_s, status counts, infra_rate,
  host RAM, pg MB), and runs `purge_pg()` + `start_pg()` every `purge_pg_steps`.
  `reward: constant` = plumbing smoke.
- `mixer.py`: `stage: grpo` → `dataset/rl/<task>/<set>` via `rl.task`; GRPO keys
  (`GRPO_KEYS`, `GRPO_MODEL_KEYS`) are only accepted under `stage: grpo`; no valid split.
  `train.py` dispatches `grpo`. `recipe/dev/smoke_grpo.yaml` (5 steps, 8 generations,
  `beta 0`, 256 tokens, `reward: constant`).

Checks:
- SFT smoke (`smoke_sft.yaml` copy with `max_steps: 2`): ok, loss 1.137, adapter saved.
  **`smoke_sft.yaml` points at the archived `osp/Nitin-1k-osp`**; the working copy (scratchpad,
  not committed) used `osp/Nitin-osp-merged`. Recipe left unchanged; needs your call.
- GRPO constant reward, 5 steps, base `0926-v13-B/sft/adapter`: loss 0 / grad_norm 0 /
  frac_reward_zero_std 1 (expected), 8.0 GB VRAM reserved, 116M trainable params (the SFT
  LoRA is trainable), 105 s/step, adapter saved; saved `chat_template.jinja` is byte-identical
  to the SFT adapter's (THINK_OFF prefix removed before save).
- GRPO real reward, 5 steps: `rollouts/step_0..4.jsonl` + `stats.jsonl` written;

  | step | loss | reward mean | reward std | compile | format | pass | zero-std |
  |---|---|---|---|---|---|---|---|
  | 1 | 0.23 | 0.771 | 0.427 | 0.875 | 0.875 | 0.75 | 0 |
  | 2 | -0.020 | 0.911 | 0.131 | 1.0 | 1.0 | 0.625 | 0 |
  | 3 | -0.033 | 0.600 | 0.283 | 1.0 | 1.0 | 0.25 | 0 |
  | 4 | 0.029 | 0.604 | 0.333 | 0.875 | 1.0 | 0.25 | 0 |
  | 5 | -0.038 | 0.775 | 0.345 | 0.875 | 1.0 | 0.5 | 0 |

  Grading 3.2–3.5 s per group of 8 (4 workers), infra_rate 0, host RAM 14.7 GB, 89 s/step.
- Reload: `utils/model.load_model(<smoke adapter>)` merges and generates; its dev samples
  grade int_to_roman 0/5, second_largest 5/5, compress_ranges 5/5.
- Fit (spike-size): 16 completions/step (batch 16 × acc 1), `max_completion_length 512`,
  3 steps: **peak 15.4 / 16.3 GB VRAM**, 322 s/step, clipped_ratio 0 (mean length 135–188).
  No OOM, so no downsizing was needed. Spike uses batch 8 × acc 2 (same 16-completion
  generation batch, smaller training micro-batch → lower peak).

Findings / decisions:
- **TRL 0.24 does not ignore `None` rewards**: it maps them to NaN and `nansum`s across reward
  functions, so with any weight-0 metric function the row becomes 0 (a model failure). The plan
  assumed a NaN-aware mean. `functions_reward` instead gives an infra-error row the mean of the
  valid rewards in its group (advantage 0); an all-infra group becomes all 0 (zero std).
- **Ornith opens a `<think>` block by default** (template: thinking unless
  `enable_thinking is false`), and TRL 0.24 renders prompts without template kwargs. `grpo.py`
  prefixes the in-memory template with a `set enable_thinking = false` default (config key
  `enable_thinking: false`) to match `utils/model.py` eval rendering, and restores it before save.
  Answers the plan's open question: thinking off, SFT adapters answer in ~100–200 tokens.
- **Shape change: `script/train/` is now a package** (`__init__.py`), and `cpt.py`, `sft.py`,
  `train.py`, `grpo.py` put `script/` on `sys.path` and import `train.utils` / `train.mixer` /
  `train.cpt` / `train.sft`. Reason: `script/train/utils.py` and the `script/utils/` package
  were both importable as `utils`, so `rl.*` (which needs `utils.jac_cli`) could not be
  imported in a training process. `python script/train/{cpt,sft,train}.py` commands are unchanged.
- **Generation is the bottleneck, and it runs on a slow path**: the log says the fla /
  causal-conv1d fast path for Ornith's linear-attention layers is missing ("Falling back to torch
  implementation"). Not installed (no package changes tonight). Worth trying next.
- lr 5e-6 (Unsloth GRPO notebooks); loss_type `dapo` (TRL 0.24 default, now explicit);
  `scale_rewards: group`; `mask_truncated_completions: true`; `purge_pg_steps` 10 by default,
  5 in the spike (pg grew ~600 MB per 8 samples during the smoke: 73 → 2718 MB over 5 steps).
- Leftover run dirs (not deleted, per the rules): `output/adapter/09-29_23-34-smoke_grpo`
  (crashed before the architectures fix), `09-29_23-35-smoke_grpo`, `09-29_23-44-smoke_grpo_real`,
  `09-29_23-30-smoke_sft_2step`, `09-29_23-53-fit_grpo_bs16`.

## Phase 4: readiness — done

Built `script/eval/rl/run_eval.py`: loads tasks with `rl.task`, renders the same prompts as
training (same seed), samples n per task with `utils/model.load_model` + `generate_batched`
(32 sequences per call), writes `predictions.jsonl` (eval/infer schema + `sample_id`), grades
each task's n samples as one `grade_many` call (= one GRPO group, timed), writes
`results.jsonl` + `summary.json` (unbiased pass@k, compile/format rate, mean reward, per-task
pass counts, `mixed_pass_frac` = 0 < passes < n, `reward_varies_frac` = partial credit
differs within the group, grading s/group). `--emit-split` writes `splits/<split>_active.txt`.
Launcher: `script/train/recipe/0930-grpo-functions-spike/readiness.sh`, log `logs/0930-rl-readiness.log`.

Train split, n=8, T=0.8, top_p 1.0, 512 new tokens, 8 grade workers, 3 GB cap, 30 s timeout:

| adapter | pass@1 | pass@8 | compile | mean reward | mixed (0<pass<8) | reward varies | grade s/group mean / max | gen s (112 samples) |
|---|---|---|---|---|---|---|---|---|
| 0926-v13-A/sft | **0.375** | 0.857 | 0.902 | 0.665 | 12/14 (0.857) | **14/14** | 2.0 / 2.2 | 66 |
| 0926-v13-B/sft | 0.304 | 0.857 | 0.955 | 0.652 | 12/14 (0.857) | 13/14 | 4.7 / 31.1 | 67 |

Per task (passes/8), A: rle_encode 5, valid_ipv4 7, word_frequency 4, dotted_keys 3, two_sum 6,
roman_to_int 3, merge_intervals 4, caesar_shift 4, group_anagrams 1, balanced_brackets 0,
binary_search 1, count_islands 1, rotate_matrix 0, eval_rpn 3.
B: 7, 3, 6, 2, 4, 1, 2, 4, 1, 1, 0, 1, 0, 2. B had one `timeout` and one `memory_cap` sample.

Decisions:
- **Adapter: 0926-v13-A.** Tied on mixed pass counts (12/14); A has more tasks with varying
  reward (14/14), which is what gives GRPO advantages, and a higher pass@1.
- No difficulty round needed (12 ≥ 5 mixed). rotate_matrix is 0/8 for both but gets partial
  credit (reward varies), so it still gives signal.
- Grading: `grade_workers 8`, `grade_mem_gb 3` (8 × 3 = 24 GB), `grade_timeout 20`
  (correct solutions ≤ 2.2 s; the only slow group was B's timeout sample).
- Eval samples with top_p 1.0 and repetition_penalty 1.0 (the GRPO rollout settings), not the
  0.9 / 1.05 that `eval/infer/adapter.py` uses. `load_model` merges the LoRA into the 4-bit base
  for eval while training generates with it unmerged; small numeric difference.

Generation-speed probe (failed, reverted): `load_model` eval generates 112 samples in ~66 s,
but GRPO rollouts take ~300 s for 16. I tried a `GRPOTrainer` subclass that switches to
`FastLanguageModel.for_inference` around `_generate_single_turn` (hypothesis: training mode +
gradient checkpointing disables the KV cache). The first step was still unfinished after
10 min (slower), so it was killed and the change reverted. Root cause of the slow rollouts is
still open (candidates: unmerged-LoRA generation path, the missing fla/causal-conv1d kernels).
