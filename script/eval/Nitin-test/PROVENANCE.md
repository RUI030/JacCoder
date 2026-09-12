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
