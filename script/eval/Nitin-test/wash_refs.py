"""Sanity-check the vendored reference solutions.

Feeds each private-split problem's `reference_completion` (or `idiomatic_jac`)
back through the grader. Any problem whose OWN reference fails to compile or
pass the hidden tests under this local Jac toolchain is flagged as broken —
those problems can't fairly score a model, so `run_eval.py` should drop them
from the denominator.
"""

import argparse
import json
import subprocess
import sys
from datetime import datetime
from pathlib import Path

_HERE = Path(__file__).resolve().parent


def read_jsonl(path: Path) -> list[dict]:
    with path.open("r", encoding="utf-8") as f:
        return [json.loads(line) for line in f if line.strip()]


def write_jsonl(path: Path, rows: list) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8") as f:
        for r in rows:
            json.dump(r, f, ensure_ascii=False)
            f.write("\n")


def build_samples(problems: list[dict], field: str) -> list[dict]:
    samples = []
    for p in problems:
        body = p.get(field)
        if not body:
            continue
        samples.append({
            "problem_id": p["id"],
            "sample_id":  0,
            "completion": body,
        })
    return samples


def summarize_status(results_fp: Path) -> tuple[list[str], list[str]]:
    ok, broken = [], []
    with results_fp.open("r", encoding="utf-8") as f:
        for line in f:
            r = json.loads(line)
            (ok if r.get("status") == "pass" else broken).append(r["problem_id"])
    return ok, broken


def main():
    cli = argparse.ArgumentParser()
    cli.add_argument("--split", choices=("dev", "test"), default="dev")
    cli.add_argument("--field", choices=("reference_completion", "idiomatic_jac"),
                     default="reference_completion",
                     help="which private field to feed back as the sample")
    cli.add_argument("--workers", type=int, default=4)
    args = cli.parse_args()

    private_fp = _HERE / "data" / "function" / "v1" / "private" / f"{args.split}.jsonl"
    grader     = _HERE / "graders" / "eval_jac.py"

    stamp = datetime.now().strftime("%m-%d_%H-%M")
    out_dir = _HERE / "out" / f"refs_{args.field}_{args.split}_{stamp}"
    samples_fp = out_dir / "samples.jsonl"

    problems = read_jsonl(private_fp)
    print(f"Problems: {len(problems)}  (private/{args.split}.jsonl)")
    print(f"Field   : {args.field}")

    samples = build_samples(problems, args.field)
    write_jsonl(samples_fp, samples)
    print(f"Wrote   : {samples_fp}  ({len(samples)} samples)")

    print("\nGrading references…")
    # Grader exits non-zero (2) whenever ANY sample is infra_error/timeout — we
    # want the results.jsonl regardless, so don't crash on exit != 0.
    rc = subprocess.run(
        [
            sys.executable, str(grader),
            "--problems", str(private_fp),
            "--samples",  str(samples_fp),
            "--out-dir",  str(out_dir),
            "--k",        "1",
            "--workers",  str(args.workers),
        ],
    ).returncode
    if rc:
        print(f"(grader exited {rc} — non-fatal, keep-going)")

    results_fp = out_dir / "results.jsonl"
    ok, broken = summarize_status(results_fp)
    ok_fp     = out_dir / "refs_ok.txt"
    broken_fp = out_dir / "refs_broken.txt"
    ok_fp.write_text("\n".join(ok)     + ("\n" if ok     else ""), encoding="utf-8")
    broken_fp.write_text("\n".join(broken) + ("\n" if broken else ""), encoding="utf-8")

    total = len(samples)
    print(f"\nReferences pass: {len(ok)}/{total} = {100 * len(ok) / total:.1f}%")
    print(f"OK ids       : {ok_fp}")
    print(f"Broken ids   : {broken_fp}  ({len(broken)} problem(s))")


if __name__ == "__main__":
    main()
