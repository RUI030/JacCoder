# Provenance

`data/function/v1/` and `graders/eval_jac.py` are vendored copies from the
`jac-data-gen` repo. Do not edit them here — re-run the copy step below to
pull a newer snapshot.

- Upstream repo: `jac-data-gen`
- Pinned commit: `dc2935e9e6b9dac607b601cd90aa07db03a3efe9`
- Copied on: 2026-09-11
- Sources:
  - `evals/function/v1/**` → `data/function/v1/**`
  - `scripts/eval/eval_jac.py` → `graders/eval_jac.py`

## Local patches on top of the vendored files

Only `graders/eval_jac.py` is patched; the eval bundle under `data/function/v1/`
is untouched. When refreshing the vendored copy from a newer upstream, re-apply
this patch on top.

**Patch: per-test pass/fail extraction (`per_test` field on results.jsonl)**
- Adds a top-level helper `parse_pytest_pertest(stdout, hidden_tests)` and one
  extra line inside the test-stage branch to store its return value on the row.
- Rationale: vendored grader collapses all hidden tests into one pass/fail per
  problem. We need per-test rate to distinguish "all wrong" from "almost right"
  in failure taxonomy.
- Works because our current `jac 0.36.0` runs pytest under the hood; parse the
  `FAILED <path>::<name>` lines and the declaration-order test names from the
  problem's `test_blocks`.
- **Latest main of jac replaces pytest with a custom runner.** When we upgrade,
  this parser will break — a new parser targeting whatever machine-readable
  output that runner emits will need to replace `parse_pytest_pertest`. Keep
  the call site (a single line under `tested = run_process(...)`) unchanged
  and the swap is minimal.

**Patch: memory cap without systemd user scopes (`_systemd_scopes_available`, `_group_rss_bytes`)**
- `_wrap_with_cgroup` used to wrap every `jac test` in `systemd-run --user --scope`
  whenever the binary existed. In containers (RunPod, init = `docker-init`) the
  binary exists but there is no user bus, so every test failed to launch. The
  scope path is now used only after a one-time probe succeeds.
- Fallback when scopes are unavailable: `run_process` polls the summed RSS of
  the test's process group every 0.5s and SIGKILLs the group over
  `--per-test-mem-gb`; the row lands as `test_fail` / `fail_reason=memory_cap`,
  same as a cgroup OOM kill. `RLIMIT_AS` was tried and rejected: the jac runtime
  reserves enough virtual address space that a 12GB cap fails
  `start_new_thread` on correct solutions.
- Limit: jac's embedded postgres daemonizes out of the process group, so its
  memory is not counted. `grade_stream.py` stops it and wipes its data dir
  between chunks and after the last chunk.

**Running on a container host (see `docs/CLOUD_GPU.md`)**
- Grade as a non-root user: jac's embedded postgres `initdb` refuses to run as
  root, so every test errors out under root.
- Set `PYTEST_XDIST_AUTO_NUM_WORKERS=4`: `jac test` uses xdist `-n auto`, which
  on a 128-core box means ~30GB and ~40s per sample (vs ~1.4GB and ~5s).
- Keep secrets out of the grader's environment (`su - <user>` starts clean).

## Refresh procedure

```bash
UPSTREAM=/path/to/jac-data-gen        # sibling repo
git -C "$UPSTREAM" checkout <new-commit>
cp -r "$UPSTREAM/evals/function/v1/." data/function/v1/
cp "$UPSTREAM/scripts/eval/eval_jac.py" graders/eval_jac.py
# Update the pinned commit hash and date above.
```

The `private/` split is **hidden reference data**. Never train on it. It is
kept alongside `public/` here only so the grader can run offline.
