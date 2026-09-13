"""Chunked, resumable wrapper around the vendored eval_jac.py grader.

Vendored graders/eval_jac.py writes results.jsonl only at the very end, so
a mid-run crash loses everything. This wrapper:

  1. Splits the input samples.jsonl into fixed-size chunks (default 20).
  2. Calls eval_jac.py once per chunk into chunks/chunk_NNN/.
  3. Skips chunks whose summary.json already exists (resume support).
  4. After all chunks complete, concatenates per-chunk results.jsonl into
     one top-level results.jsonl and writes a lightweight summary.json
     (status counts + pass@1).

Keeps the vendored eval_jac.py untouched — provenance stays clean.
"""

from __future__ import annotations

import argparse
import json
import os
import shutil
import subprocess
import sys
from collections import Counter
from pathlib import Path


def read_jsonl(path: Path) -> list[dict]:
    with path.open("r", encoding="utf-8") as f:
        return [json.loads(line) for line in f if line.strip()]


def write_jsonl(path: Path, rows: list[dict]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8") as f:
        for r in rows:
            json.dump(r, f, ensure_ascii=False)
            f.write("\n")


def chunk_dirname(idx: int) -> str:
    return f"chunk_{idx:03d}"


def run_chunk(
    grader: Path, problems: Path, chunk_dir: Path,
    samples: list[dict], k: str, timeout: float,
) -> None:
    chunk_dir.mkdir(parents=True, exist_ok=True)
    samples_fp = chunk_dir / "samples.jsonl"
    write_jsonl(samples_fp, samples)

    # eval_jac exits non-zero when any sample is infra_error/timeout — that's
    # fine, we still want results.jsonl. Only truly fatal exits should abort.
    rc = subprocess.run(
        [
            sys.executable, str(grader),
            "--problems", str(problems),
            "--samples",  str(samples_fp),
            "--out-dir",  str(chunk_dir),
            "--k",        k,
            "--workers",  "1",           # sequential; postgres cap is 64
            "--timeout",  str(timeout),
        ],
    ).returncode
    if rc and not (chunk_dir / "results.jsonl").is_file():
        raise RuntimeError(f"grader exited {rc} without writing results for {chunk_dir}")


def merge_results(chunk_dirs: list[Path], out_dir: Path) -> None:
    all_rows: list[dict] = []
    for cd in chunk_dirs:
        rf = cd / "results.jsonl"
        if not rf.is_file():
            print(f"WARNING: missing {rf}")
            continue
        all_rows.extend(read_jsonl(rf))

    (out_dir / "results.jsonl").write_text(
        "".join(json.dumps(r, sort_keys=True) + "\n" for r in all_rows),
        encoding="utf-8",
    )

    status_counts = Counter(r.get("status") for r in all_rows)
    passed = status_counts.get("pass", 0)
    total = len(all_rows)
    summary = {
        "schema_version": "stream-1",
        "n_samples": total,
        "status_counts": dict(status_counts),
        "pass_at_1": {"eligible": total, "value": passed / total if total else 0.0},
        "note": "aggregated by grade_stream.py; per-chunk summaries live in chunks/",
    }
    (out_dir / "summary.json").write_text(
        json.dumps(summary, indent=2) + "\n", encoding="utf-8"
    )
    print(f"\nAggregated: {passed}/{total} pass ({100 * passed / total:.1f}%) "
          f"→ {out_dir / 'results.jsonl'}")
    print(f"status_counts: {dict(status_counts)}")


_SENTINEL_ENV = "NITIN_UNDER_SYSTEMD_SCOPE"


def relaunch_under_cgroup(mem_max: str = "32G", mem_high: str = "28G") -> None:
    """Re-exec ourselves inside `systemd-run --user --scope` so this process and
    every child (eval_jac.py, jac test) run in a cgroup with a hard memory cap.
    If we exceed the cap, the kernel kills something inside the cgroup — not
    the whole session. Skip re-exec when already inside a scope, or when
    `systemd-run` is unavailable, or when `--no-cgroup` was passed."""
    if os.environ.get(_SENTINEL_ENV) == "1":
        print(f"[cgroup] already inside scope (MemoryMax={mem_max}); running")
        return
    if "--no-cgroup" in sys.argv:
        sys.argv.remove("--no-cgroup")
        print("[cgroup] --no-cgroup passed, skipping systemd-run wrap")
        return
    sr = shutil.which("systemd-run")
    if not sr:
        print("[cgroup] systemd-run not found on PATH; running without cgroup cap")
        return

    env = {**os.environ, _SENTINEL_ENV: "1"}
    cmd = [
        sr, "--user", "--scope", "--quiet",
        "--property", f"MemoryMax={mem_max}",
        "--property", f"MemoryHigh={mem_high}",
        "--property", "OOMPolicy=continue",  # kill just the offender, not the scope
        sys.executable, *sys.argv,
    ]
    print(f"[cgroup] re-exec under systemd-run (MemoryMax={mem_max}, MemoryHigh={mem_high})",
          flush=True)
    os.execvpe(sr, cmd, env)


def lower_oom_score(adj: int = -500) -> None:
    """Make ourselves (and children by inheritance) a less attractive OOM
    target. Range is -1000..1000; negative = less likely to be killed.
    Non-root can go as low as -500. Silent on failure."""
    try:
        with open("/proc/self/oom_score_adj", "w") as f:
            f.write(f"{adj}\n")
        print(f"[oom] set oom_score_adj={adj} on self (inherited by children)")
    except OSError as e:
        print(f"[oom] could not set oom_score_adj: {e}")


def main():
    relaunch_under_cgroup()
    lower_oom_score(-500)

    cli = argparse.ArgumentParser(description=__doc__)
    cli.add_argument("--problems", type=Path, required=True,
                     help="private-split jsonl (with hidden test_blocks)")
    cli.add_argument("--samples",  type=Path, required=True,
                     help="samples.jsonl to grade (from run_eval.py)")
    cli.add_argument("--out-dir",  type=Path, required=True,
                     help="output dir; chunks/ + final results.jsonl land here")
    cli.add_argument("--chunk-size", type=int, default=20,
                     help="samples per grader invocation (checkpoint interval)")
    cli.add_argument("--k",       default="1")
    cli.add_argument("--timeout", type=float, default=180.0,
                     help="per-stage seconds passed to the grader")
    cli.add_argument("--grader",  type=Path,
                     default=Path(__file__).resolve().parent / "eval_jac.py",
                     help="path to the vendored eval_jac.py")
    cli.add_argument("--skip-ids", type=Path, default=None,
                     help="text file of problem ids to exclude (one per line); "
                          "use for known-runaway samples that OOM the grader")
    args = cli.parse_args()

    args.out_dir.mkdir(parents=True, exist_ok=True)
    chunks_root = args.out_dir / "chunks"
    chunks_root.mkdir(parents=True, exist_ok=True)

    samples = read_jsonl(args.samples)
    if args.skip_ids:
        skip = {ln.strip() for ln in args.skip_ids.read_text().splitlines() if ln.strip()}
        before = len(samples)
        samples = [s for s in samples if s["problem_id"] not in skip]
        print(f"[skip-ids] {before - len(samples)} samples excluded → {len(samples)} remain")
    chunks = [samples[i : i + args.chunk_size]
              for i in range(0, len(samples), args.chunk_size)]
    print(f"Samples : {len(samples)}")
    print(f"Chunks  : {len(chunks)}  (size={args.chunk_size})")
    print(f"Out dir : {args.out_dir}")
    print()

    chunk_dirs = []
    for i, chunk in enumerate(chunks):
        cd = chunks_root / chunk_dirname(i)
        chunk_dirs.append(cd)
        done_marker = cd / "results.jsonl"
        if done_marker.is_file():
            print(f"[skip] chunk {i:03d} already done  ({done_marker})")
            continue
        print(f"[run ] chunk {i:03d}  {len(chunk)} samples  → {cd}", flush=True)
        run_chunk(args.grader, args.problems, cd, chunk, args.k, args.timeout)

    merge_results(chunk_dirs, args.out_dir)


if __name__ == "__main__":
    main()
