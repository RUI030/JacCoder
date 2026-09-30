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
- [ ] P3 load_trainable + chat-template check in train/utils.py; cpt/sft use it; smoke SFT max_steps=2
- [ ] P3 train/grpo.py, rl/rewards.py (cache, pool, None on infra_error, rollouts log, purge_pg every N), mixer/train.py grpo stage, smoke_grpo.yaml
- [ ] P3 5 steps dummy reward, 5 steps real reward; save + reload via load_model; log step time + fitting settings; commit
- [ ] P4 script/eval/rl/run_eval.py; readiness on v13-B and v13-A (pass@1/8, compile, mixed frac, grade time); pick adapter; ≤2 difficulty rounds; set grade_*; commit
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
