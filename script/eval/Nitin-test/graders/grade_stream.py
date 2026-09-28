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
from collections import Counter, defaultdict
from pathlib import Path

from eval_jac import pass_at_k


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
    samples: list[dict], k: str, timeout: float, workers: int = 1,
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
            "--workers",  str(workers),  # postgres caps clients at 64: workers x xdist
            "--timeout",  str(timeout),
        ],
    ).returncode
    if rc and not (chunk_dir / "results.jsonl").is_file():
        raise RuntimeError(f"grader exited {rc} without writing results for {chunk_dir}")


def test_pass_fraction(row: dict) -> float:
    """Share of hidden tests passed; 0 when no test ran (check_fail etc.)."""
    tests = row.get("per_test") or []
    return sum(t["passed"] is True for t in tests) / len(tests) if tests else 0.0


def pass_curve(grouped: dict[str, list[bool]], ks: list[int]) -> dict:
    """{k: {eligible_problems, value}}; problems with fewer than k samples are skipped."""
    curve = {}
    for k in ks:
        est = [e for e in (pass_at_k(len(v), sum(v), k) for v in grouped.values())
               if e is not None]
        curve[str(k)] = {"eligible_problems": len(est),
                         "value": sum(est) / len(est) if est else None}
    return curve


def per_problem_stats(rows: list[dict], ks: list[int]) -> dict:
    """pass@k, the per-problem pass-rate spread, and how close unsolved problems get.

    - `pass_at_k`: the requested --k values.
    - `pass_curve`: pass@1..n (n = fewest samples any problem has), cumulative
      share of problems solved within j tries.
    - `p_hat_buckets` / `passes_hist`: p_hat = passes / samples per problem.
      Only 0 < p_hat < 1 gives GRPO a non-zero advantage with a pass/fail reward.
    - `unsolved`: problems no sample passed, bucketed by the best test-pass
      fraction over their samples; high values mean a partial (per-test)
      reward still has signal there.
    """
    grouped: dict[str, list[bool]] = defaultdict(list)
    best_frac: dict[str, float] = defaultdict(float)
    statuses: dict[str, Counter] = defaultdict(Counter)
    for r in rows:
        pid = r["problem_id"]
        grouped[pid].append(r.get("status") == "pass")
        best_frac[pid] = max(best_frac[pid], test_pass_fraction(r))
        statuses[pid][r.get("status")] += 1
    n_min = min((len(v) for v in grouped.values()), default=0)
    p_hat = [sum(v) / len(v) for v in grouped.values()]

    unsolved = [pid for pid, v in grouped.items() if not any(v)]
    fracs = [best_frac[pid] for pid in unsolved]
    return {
        "n_problems":          len(grouped),
        "samples_per_problem": sorted(Counter(len(v) for v in grouped.values()).items()),
        "pass_at_k":           pass_curve(grouped, ks),
        "pass_curve":          pass_curve(grouped, list(range(1, n_min + 1))),
        "p_hat_buckets": {
            "zero":    sum(p == 0 for p in p_hat),
            "partial": sum(0 < p < 1 for p in p_hat),
            "all":     sum(p == 1 for p in p_hat),
        },
        "passes_hist": dict(sorted(Counter(f"{sum(v)}/{len(v)}"
                                           for v in grouped.values()).items())),
        "unsolved": {
            "n":                len(unsolved),
            "best_test_frac": {
                "0%":     sum(f == 0 for f in fracs),
                "1-49%":  sum(0 < f < 0.5 for f in fracs),
                "50-99%": sum(f >= 0.5 for f in fracs),
            },
            "mean_best_test_frac": sum(fracs) / len(fracs) if fracs else None,
            "sample_status":  dict(sum((statuses[pid] for pid in unsolved), Counter())),
        },
    }


def merge_results(chunk_dirs: list[Path], out_dir: Path, ks: list[int]) -> None:
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
        **per_problem_stats(all_rows, ks),
        "note": "aggregated by grade_stream.py; per-chunk summaries live in chunks/",
    }
    (out_dir / "summary.json").write_text(
        json.dumps(summary, indent=2) + "\n", encoding="utf-8"
    )
    print(f"\nAggregated: {passed}/{total} pass ({100 * passed / total:.1f}%) "
          f"→ {out_dir / 'results.jsonl'}")
    print(f"status_counts: {dict(status_counts)}")
    for k, v in summary["pass_at_k"].items():
        if v["value"] is not None:
            print(f"pass@{k}: {100 * v['value']:.1f}%  ({v['eligible_problems']} problems)")
    curve = "  ".join(f"@{k} {100 * v['value']:.1f}%"
                      for k, v in summary["pass_curve"].items() if v["value"] is not None)
    print(f"pass curve   : {curve}")
    print(f"p_hat buckets: {summary['p_hat_buckets']}")
    print(f"passes hist  : {summary['passes_hist']}")
    print(f"unsolved     : {summary['unsolved']['n']}  best test frac "
          f"{summary['unsolved']['best_test_frac']}")


_JAC_PG_ROOT  = Path.home() / ".cache" / "jac" / "pg"
_JAC_PG_CACHE = _JAC_PG_ROOT / "main"


def _pg_ctl_bin() -> Path | None:
    """Locate jac's bundled pg_ctl under ~/.cache/jac/pg/dist/<platform>/bin."""
    dist = _JAC_PG_ROOT / "dist"
    if not dist.is_dir():
        return None
    for plat_dir in dist.iterdir():
        candidate = plat_dir / "bin" / "pg_ctl"
        if candidate.is_file():
            return candidate
    return None


def purge_jac_pg_cache() -> None:
    """Wipe jac's embedded-postgres data dir between grader chunks.

    Each `jac test` invocation reseeds an empty database from `pg/dist`
    if `pg/main` is absent, so deletion is safe. Without this, `main/`
    grew to 1.1 TB across ~360 samples on a prior run.

    We first `pg_ctl stop` (fast mode) if a postmaster is up, else the
    rmtree would corrupt an in-flight database. The next chunk will
    re-spawn postgres cleanly.
    """
    if not _JAC_PG_CACHE.exists():
        return
    pid_file = _JAC_PG_CACHE / "postmaster.pid"
    if pid_file.is_file():
        pg_ctl = _pg_ctl_bin()
        if pg_ctl is None:
            print(f"[pg-purge] SKIP: postmaster.pid present, pg_ctl not found")
            return
        rc = subprocess.run(
            [str(pg_ctl), "-D", str(_JAC_PG_CACHE), "-m", "fast",
             "-w", "-t", "20", "stop"],
            capture_output=True, text=True,
        ).returncode
        if rc != 0 or pid_file.exists():
            # Fall back to SIGTERM on the postmaster PID.
            try:
                pid = int(pid_file.read_text().splitlines()[0].strip())
                os.kill(pid, 15)
                for _ in range(20):
                    if not pid_file.exists():
                        break
                    subprocess.run(["sleep", "0.5"])
            except (OSError, ValueError) as e:
                print(f"[pg-purge] SKIP: could not stop postgres ({e})")
                return
        if pid_file.exists():
            print(f"[pg-purge] SKIP: postmaster.pid still present after stop")
            return
    try:
        shutil.rmtree(_JAC_PG_CACHE)
        print(f"[pg-purge] wiped {_JAC_PG_CACHE}")
    except OSError as e:
        print(f"[pg-purge] failed: {e}")


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
    # Containers (RunPod: init = docker-init) ship systemd-run but have no user
    # bus; exec'ing into it would replace us with a process that just fails.
    probe = subprocess.run([sr, "--user", "--scope", "--quiet", "--collect", "true"],
                           capture_output=True, text=True, timeout=15)
    if probe.returncode != 0:
        print(f"[cgroup] systemd-run scopes unavailable ({probe.stderr.strip()}); "
              "running without cgroup cap (eval_jac per-test RSS watchdog still applies)")
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
    cli.add_argument("--workers", type=int, default=1,
                     help="parallel samples per chunk; each `jac test` also runs "
                          "PYTEST_XDIST_AUTO_NUM_WORKERS xdist workers (default 4 here), "
                          "and the embedded postgres allows 64 clients in total")
    cli.add_argument("--skip-ids", type=Path, default=None,
                     help="text file of problem ids to exclude (one per line); "
                          "use for known-runaway samples that OOM the grader")
    args = cli.parse_args()
    # xdist `-n auto` = one worker per core; on a 32-core box a few parallel
    # samples exhaust postgres' 64 clients ("too many clients already").
    os.environ.setdefault("PYTEST_XDIST_AUTO_NUM_WORKERS", "4")

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
        if done_marker.is_file() and done_marker.stat().st_size > 0:
            print(f"[skip] chunk {i:03d} already done  ({done_marker})")
            continue
        # Purge jac's embedded-postgres data dir between chunks so a
        # long run cannot balloon it to fill the disk (~50 MB per test
        # blocks × thousands of samples = full nvme).
        purge_jac_pg_cache()
        print(f"[run ] chunk {i:03d}  {len(chunk)} samples  → {cd}", flush=True)
        run_chunk(args.grader, args.problems, cd, chunk, args.k, args.timeout, args.workers)

    # Postgres daemonizes out of the test's process group, so it outlives the
    # last chunk (holding its data dir) unless stopped here too.
    purge_jac_pg_cache()
    merge_results(chunk_dirs, args.out_dir, [int(k) for k in args.k.split(",")])


if __name__ == "__main__":
    main()
