# function/v1-cleaned

Filtered copy of `data/function/v1/` containing ONLY problems whose own
`reference_completion` passes the hidden test blocks under our local jac
toolchain (`jac 0.36.0`), when the grader runs sequentially (`--workers 1
--timeout 180`).

## Provenance

- Source: `data/function/v1/{public,private}/dev.jsonl` (200 rows each)
- Wash run: `out/refs_reference_completion_dev_09-12_13-47/`
- Wash config: `--workers 1 --timeout 180`
- Result: **185/200 refs pass** → this subset
- Discarded 15 problems:
  - 12 `test_fail` (reference logic bugs)
  - 2 `infra_error`
  - 1 `check_fail` (reference compile failure)

Only dev split is cleaned here. Test split (1000 rows) hasn't been washed yet.

## Use

Point `run_eval.py` at this subset:

```bash
python script/eval/Nitin-test/run_eval.py \
  --adapter <path> --split dev --workers 1 --timeout 180 \
  --data data/function/v1-cleaned
```

(`run_eval.py` currently hardcodes the v1 path — update it or pass
`--only-ids refs_ok.txt` against v1 for the same effect.)
