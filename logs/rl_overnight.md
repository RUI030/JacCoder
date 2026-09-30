# RL spike overnight log (2026-09-29 → 09-30)

Branch `rl-spike`. Spec: `docs/RL_Implementation_plan.md`, `docs/RL.md`.
Host: RTX 5080 16 GB, 61 GB RAM, 32 cores, jac 0.36.1, env `tornith` (trl 0.24.0, unsloth 2026.8.19, transformers 5.5.0).

Answers given before start: purge `~/.cache/jac/pg` freely; host dedicated overnight;
format rule = any prose allowed, exactly one ```` ```jac ```` block.

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
