# Provenance

`data/function/v1/` and `graders/eval_jac.py` are vendored copies from the
`jac-data-gen` repo. Do not edit them here — re-run the copy step below to
pull a newer snapshot.

- Upstream repo: `jac-data-gen`
- Pinned commit: `ed403a5648ecad42a92b01c2c110616749a666fd` (includes `9fca322e`, the 2026-09-16 repair of
  function/v1 for jac 0.36.1)
- Copied on: 2026-09-26 (previous snapshot: `dc2935e9`, 2026-09-11)
- Sources:
  - `evals/function/v1/**` → `data/function/v1/**`
  - `scripts/eval/eval_jac.py` → `graders/eval_jac.py`

## Upstream behavior worth knowing (since `9fca322e`)

- Test literals that fail jac 0.36.1's strict type check were rewritten or
  dropped (`data/function/v1/repair_report.jsonl`); test went 1000 → 972
  tasks, dev 400 → 394, and every reference passes
  (`validation_summary.json`). Results graded on the 09-11 snapshot are not
  comparable with results on this one.
- Tests run in annex mode (`candidate.jac` + `tests.jac` doing
  `import from candidate { <entrypoint> }`) with a `jac.toml` pinning
  `[build] default_codespace = "server"`. The native codespace dropped assert
  messages, hit "no tests ran" on Python-demoted functions, and could segfault.
  `--native-codespace` opts out.

## Local patches on top of the vendored files

Only `graders/eval_jac.py` is patched; the eval bundle under `data/function/v1/`
is untouched. When refreshing the vendored copy from a newer upstream, re-apply
these patches on top (a 3-way `git merge-file` against the old upstream copy
works; conflicts so far were only adjacent keyword arguments).
`graders/test_eval_jac_patch.py` covers the per-test patch (plain asserts).

**Patch: per-test results and actual values (`per_test` field on results.jsonl)**
- Rationale: the vendored grader collapses all hidden tests into one pass/fail
  per problem, and never records what the candidate returned. We need per-test
  rates to separate "all wrong" from "almost right", and the actual value to
  see how a test failed.
- `instrument_tests(hidden_tests)` rewrites each `assert (L == R)[, msg]` to
  bind `L`, `print("@@ACTUAL <test> <k> " + repr(L))`, then assert on the
  binding. A string/bracket-aware scanner splits statements; anything that is
  not a single top-level `==` (2 chained comparisons in the suite) is left
  untouched. pytest shows captured stdout only for failing tests.
- `jac test -v` gives an explicit `PASSED`/`FAILED`/`ERROR <file>::<test>` line
  per test. `parse_pytest_pertest(stdout, hidden_tests)` returns
  `[{"name", "passed": true|false|null, "error"?, "actual"?}]`: `null` means no
  verdict was reported (e.g. `ERROR tests.jac - failed to import`), no longer
  counted as a pass. `error` is the first `E   ` line of the test's failure
  section; `actual` is kept only when that error is an `AssertionError`.
- `grade_one(..., stages=[...])` collects each `run_process` result, and
  `main` writes them to `<out-dir>/logs/<problem>__<sample>.log` (tail-capped
  at 256 KB per stream; `--no-logs` skips). Logs contain hidden-test text.
- `INFRA_ERROR_RE` also matches `too many clients already` (postgres 53300),
  which otherwise lands as a model `test_fail`.
- Works because `jac 0.36.1` runs pytest (+xdist) under the hood. **Latest
  main of jac replaces pytest with a custom runner**: the verdict regexes,
  failure-section parsing and possibly the print capture must be redone then.
  A format change shows up as all-`null` `per_test`, not as fake passes.

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
- `PYTEST_XDIST_AUTO_NUM_WORKERS=4` (`grade_stream.py` sets it by default): `jac test` uses xdist `-n auto`, which
  on a 128-core box means ~30GB and ~40s per sample (vs ~1.4GB and ~5s).
- Keep secrets out of the grader's environment (`su - <user>` starts clean).

## Refresh procedure

```bash
UPSTREAM=/path/to/jac-data-gen        # sibling repo
OLD=<pinned-commit>; NEW=<new-commit>
git -C "$UPSTREAM" archive "$NEW" evals/function/v1 | tar -x --strip-components=3 -C data/function/v1
# Re-apply local patches: 3-way merge of ours onto the new upstream grader.
git -C "$UPSTREAM" show "$OLD:scripts/eval/eval_jac.py" > /tmp/eval_jac_base.py
git -C "$UPSTREAM" show "$NEW:scripts/eval/eval_jac.py" > /tmp/eval_jac_new.py
git merge-file graders/eval_jac.py /tmp/eval_jac_base.py /tmp/eval_jac_new.py   # resolve any conflicts
python graders/test_eval_jac_patch.py
# Update the pinned commit hash and date above, then re-run wash_refs.py.
```

The `private/` split is **hidden reference data**. Never train on it. It is
kept alongside `public/` here only so the grader can run offline.
