# RL spike overnight log (2026-09-29 → 09-30)

Branch `rl-spike`. Spec: `docs/RL_Implementation_plan.md`, `docs/RL.md`.
Host: RTX 5080 16 GB, 61 GB RAM, 32 cores, jac 0.36.1, env `tornith` (trl 0.24.0, unsloth 2026.8.19, transformers 5.5.0).

Answers given before start: purge `~/.cache/jac/pg` freely; host dedicated overnight;
format rule = any prose allowed, exactly one ```` ```jac ```` block.

## Summary (read this first)

| phase | status |
|---|---|
| 1 dataset (`dataset/rl/functions/spike-sample-20`, 20 tasks / 109 hidden tests) | done |
| 2 grader (`utils/jac_cli`, `script/rl/`, self-test) | done |
| 3 GRPO plumbing (`train/grpo.py`, `rl/rewards.py`, `stage: grpo`) | done |
| 4 readiness (`eval/rl/run_eval.py`) → picked **0926-v13-A** | done |
| 5 spike run, 50 steps, `output/adapter/0930-grpo-functions-spike/grpo/` | done |
| 6 GSPO | **skipped**: 50 matched steps need ~4.6 h, not possible before 07:30 |
| 7 docs (CLAUDE.md, CONVENTION.md, recipe README, eval README, plan divergences) | done |

Key numbers:
- Spike (GRPO, v13-A SFT → 50 steps, 16 completions/step, 2 groups × 8, lr 5e-6, beta 0): 4 h 32 min,
  ~327 s/step avg. Train reward 0.656 → 0.795 (steps 1–10 → 31–40), pass rate 0.34 → 0.59,
  compile 0.89 → 0.96. 0 infra errors in 774 graded samples, host RAM ≤ 17.0 GB, pg dir ≤ 4.4 GB (purged every 5 steps).
- Train split (n=8, T=0.8), SFT v13-A → GRPO: pass@1 0.375 → **0.509**, pass@8 0.857 → 0.929,
  compile 0.902 → 0.964, mean reward 0.665 → 0.765.
- **Dev split (3 tasks × 8), SFT v13-A → GRPO: pass@1 0.250 → 0.458, pass@8 0.667 → 1.000**, mean reward
  0.517 → 0.608, compile 0.833 → 0.833. checkpoint-25 on dev: pass@1 0.250 (= SFT). Dev is only 24 samples.
- Test split never evaluated (kept as the holdout).

Needs your decision:
1. `script/train/recipe/dev/smoke_sft.yaml` points at the archived `osp/Nitin-1k-osp`; the smoke used a scratch copy
   with `Nitin-osp-merged`. Update the recipe, or keep it as is?
2. `script/train/` is now a package, and train scripts import `train.utils` / `train.mixer` (see Phase 3). This is a
   shape change: keep it, or rename `train/utils.py` instead?
3. Generation speed: GRPO rollouts run on the torch fallback (fla / causal-conv1d missing) and take ~5× longer
   per sample than `generate_batched` eval. Installing those kernels, or vLLM, needs a `requirement.txt` / env change.
4. Is the dev gain real? 3 dev tasks is too few to say. Grow dev/test (and train) before a longer run.
5. Watch item: on dev `int_to_roman`, GRPO answers 4/8 times with an enumerated lookup table that runs into the 512-token
   cap (SFT truncated 3/8 with long if-chains instead). None of the train rollouts show this.

Suggested next steps:
- More tasks (a producer under `script/dataset/rl/`, deduped against Nitin-test clusters), especially
  harder ones: 5/14 train tasks were still at ≤ 1/8 passes at readiness.
- A longer run once generation is faster; 50 steps = ~7 passes over 14 tasks. Groups with zero std
  reached 10–15% late in the run, so easy tasks are beginning to saturate.
- GSPO vs GRPO at matched steps (e.g. 25 vs `checkpoint-25`), and the Qwen3-Coder MoE on a larger GPU.
- `rollouts/` is ready for a proper reward-hacking audit: 354 passes, no escapes or test blocks were found.

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
- [x] P5 spike recipe; nohup launch + tee; monitor (reward, compile, zero-std, infra err, RAM, pg size); dev eval final vs base; reward-hacking spot-check; commit
- [x] P6 GSPO — skipped (no time for 50 matched steps)
- [x] P7 docs: CONVENTION, CLAUDE.md, recipe README, eval README, plan divergences; summary at top of this log; commit

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

## Phase 5: spike run — done

Recipe `script/train/recipe/0930-grpo-functions-spike/grpo.yaml`, launcher `run.sh` (grader self-test →
train → dev evals), log `logs/0930-grpo-functions-spike.log`, run `output/adapter/0930-grpo-functions-spike/grpo/`
(checkpoint-25, checkpoint-50, adapter, rollouts/, runs/). Base `0926-v13-A/sft/adapter`, batch 8 × acc 2
(16 completions = 2 groups of 8), T 0.8, top_p 1.0, 512 new tokens, lr 5e-6, beta 0, dapo loss, token-level IS,
grade_workers 8 / grade_mem_gb 3 / grade_timeout 20, purge_pg_steps 5. Launched 00:27, finished 04:59
(train_runtime 16,340 s; the first step took 708 s, then 260–470 s/step).

| steps | reward | compile | pass | zero-std groups | mean length |
|---|---|---|---|---|---|
| 1–10 | 0.656 | 0.887 | 0.338 | 0.00 | 179 |
| 11–20 | 0.659 | 0.894 | 0.375 | 0.00 | 155 |
| 21–30 | 0.732 | 0.944 | 0.456 | 0.00 | 159 |
| 31–40 | 0.795 | 0.956 | 0.594 | 0.15 | 166 |
| 41–50 | 0.773 | 0.919 | 0.550 | 0.10 | 154 |

Monitoring (every step): infra-error rate 0 throughout (774 unique graded samples of 800 generated; duplicates are graded once: 354 pass, 354 test_fail,
58 check_fail, 6 format_fail, 2 timeout); host RAM 12.7–17.0 GB of 61; `~/.cache/jac/pg` peaked at
4.4 GB and dropped to 57 MB after each purge; grading 3.4–22.9 s per step (mean 4.4 s), i.e.
generation is ~98% of the step. No stop condition triggered.

Evals (`run_eval.py`, n=8, T=0.8, 512 tokens):

| adapter | split | pass@1 | pass@8 | compile | mean reward | per task |
|---|---|---|---|---|---|---|
| v13-A SFT | dev | 0.250 | 0.667 | 0.833 | 0.517 | int_to_roman 0, second_largest 3, compress_ranges 3 |
| GRPO checkpoint-25 | dev | 0.250 | 0.667 | 1.000 | 0.542 | 0, 3, 3 |
| **GRPO final (50)** | dev | **0.458** | **1.000** | 0.833 | 0.608 | 2, 4, 5 |
| v13-A SFT | train | 0.375 | 0.857 | 0.902 | 0.665 | (Phase 4) |
| GRPO final (50) | train | 0.509 | 0.929 | 0.964 | 0.765 | rle 7, ipv4 7, wordfreq 7, dotted 0, two_sum 6, roman 2, merge 5, caesar 4, anagrams 1, brackets 3, bsearch 8, islands 1, rotate 1, rpn 5 |

Reward-hacking spot-checks (at steps 0–3, 0–24, and all 50): no completion used a forbidden import, `::py::`,
a test block, `print`/`open`/`exec`; 3 passing samples import `re` (legitimate). Completions flagged by a
"≥3 `if x == literal { return }`" heuristic were real validation code (valid_ipv4). Lookup-table-like
completions: 0 in 774 train rollouts. On dev `int_to_roman` (not trained on), 4/8 GRPO samples were
format_fail because they enumerate numerals as a table until the 512-token cap; SFT's 3 format_fails there
are long if-chains, also truncated.

Decisions:
- At step 8 the average was ~455 s/step (ETA ~07:00), so I prepared a resume from checkpoint-25 capped at
  40 steps. At step 25 the average had fallen to 353 s/step (ETA ~05:20), so the run continued to 50
  unchanged, with `checkpoint-25` as the fallback. The resume launcher was deleted unused.
- TRL's metrics go to TensorBoard only (with `report_to: tensorboard` no loss dicts are printed), so the
  monitor read `runs/*/events*` plus `rollouts/stats.jsonl`.
- The final adapter was also evaluated on train, and checkpoint-25 on dev, to separate learning from noise.
  Test split left untouched.

## Phase 6: GSPO — skipped

At 05:03 there was ~2.5 h left before 07:30; 50 matched steps take ~4.6 h. A 25-step GSPO run compared against
`checkpoint-25` would just fit (~2.3 h plus eval) but leaves no margin, so it was not started. Suggested as the next experiment.

## Phase 7: docs — done

- `docs/CONVENTION.md`: `rl/` domain, `train/` package note, `grpo.py`, `eval/rl/`, `dataset/rl/` layout, `jac_cli` scope.
- `CLAUDE.md`: RL commands, RL architecture paragraph, `load_trainable`, gotchas (train package, pg growth +
  purge, `SERVER_TOML` / native lowering, lambda bug, `None` rewards in TRL 0.24, thinking default, slow rollouts).
- `script/train/recipe/README.md`: `stage: grpo`, its keys, dataset resolution, outputs.
- `script/eval/README.md`: `eval/rl/run_eval.py` rows and output layout.
- `docs/RL_Implementation_plan.md`: divergence box under the scope, inline notes on the `None`-reward
  assumption and the thinking-mode open question.

## Follow-up (09-30): spike recipe counted in epochs

At your request, `0930-grpo-functions-spike/grpo.yaml` now uses `epochs: 7` (49 steps, every train task exactly
7 times) and `save_steps: 7` (one checkpoint per epoch) instead of `max_steps: 50`. The 09-30 run's 50 steps were
7 epochs + 1 step: per-task step counts from `rollouts/` were 7 for 12 tasks and 8 for roman_to_int and
word_frequency. The run's own `recipe.yaml` copy still records `max_steps: 50`. `recipe/README.md` recommends
`epochs` for GRPO. `dev/smoke_grpo.yaml` keeps `max_steps: 5` (a plumbing test, shorter than one epoch).

## Follow-up (09-30): one meta.json per set

At your request, the 20 `tasks/<id>/meta.json` files were replaced by one
`dataset/rl/functions/spike-sample-20/meta.json`: shared fields once (`task_type`, `target`, `output_format`,
`forbidden`), plus `tasks: {<id>: {entrypoints, difficulty}}`. `tasks/<id>/` now holds only what the model
sees (`request.md`, `starter.jac`). `rl/task.py` gained `set_meta` (cached) and `task_meta(task_dir)`, which
merges the two into the same dict shape as before, so the harness and graders are unchanged;
`check_splits` also fails if the meta's task ids and `tasks/` differ. `grade_completion` reads meta via
`task_meta`. Checks: `test_functions.py --workers 8` all PASS; the spike recipe still loads 14 rows.
Docs updated: `docs/RL.md` tree, plan (divergence note + layout), `CLAUDE.md`, `CONVENTION.md`.

## Follow-up (09-30): Nitin-osp-compile-only as RL source — skipped

Looked at `dataset/cpt/Nitin-osp-compile-only` (5,157 OSP programs, `jac check` only, no tests; 970 keep a
natural-language request comment; median ~2,000 tokens, 1,133 at ≤ 800). 40 sampled programs all `jac run`,
print the same stdout twice (median 6 lines, ~0.4 s). Possible task: strip some walker/ability bodies and
reward stdout matching the reference. v13-B's CPT includes this set, v13-A's doesn't; no overlap with v13-A's
other data (origin_id or code). **Skipped by your decision:** nobody has verified the programs are correct,
and an output-match reward would teach the model to reproduce the reference's bugs.

## Follow-up (10-02): overfitting check on Nitin's suite

`script/eval/Nitin-test/run_eval.py --adapter output/adapter/0930-grpo-functions-spike/grpo/adapter --split test
--tag v13A-grpo --workers 6` (same settings as the v1.3-A run), output `script/eval/Nitin-test/out/v13A-grpo_test_10-02_14-13`,
log `logs/1002-v13A-grpo-nitin-test.log`, 53 min. 972 problems, greedy:

| | pass@1 | completion | translation | compile | test cases |
|---|---:|---:|---:|---:|---:|
| v1.3-A SFT | 56.3% (547) | 32.7% (159) | 79.8% (388) | 87.6% | 82.3% |
| v1.3-A + GRPO | 56.9% (553) | 34.0% (165) | 79.8% (388) | 87.2% | 83.0% |

Flips: 14 pass only with GRPO, 8 only with SFT (exact McNemar p = 0.29). No regression, no significant gain.
Within-group answer diversity in rollouts stayed high (distinct code per group of 8: 0.99 at steps 1–10, 0.94–0.96 at 31–50).
