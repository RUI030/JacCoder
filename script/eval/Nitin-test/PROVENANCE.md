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
