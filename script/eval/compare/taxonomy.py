"""Failure taxonomy on pf / fp / ff buckets between two report.json files.

pf = A pass, B fail  (regressions if B is newer)
fp = A fail, B pass  (fixes)
ff = both fail       (shared hard cases)

For each bucket, cluster samples by the first line of check_err, normalized.
"""
import argparse, json, re
from collections import Counter, defaultdict
from pathlib import Path

ap = argparse.ArgumentParser()
ap.add_argument("--a", required=True)
ap.add_argument("--b", required=True)
ap.add_argument("--label-a", default="A")
ap.add_argument("--label-b", default="B")
ap.add_argument("--top", type=int, default=6, help="top-N buckets to print per group")
args = ap.parse_args()

def normalize(line: str) -> str:
    line = re.sub(r'^[^:]+:\d+:\d+\s*-?\s*', '', line)
    line = re.sub(r"'[^']{1,40}'", "'<id>'", line)
    line = re.sub(r'"[^"]{1,40}"', '"<id>"', line)
    line = re.sub(r"\s+", " ", line).strip()
    return line[:180]

def first_err_line(s):
    err = (s.get("check_err") or "").strip()
    for raw in err.splitlines():
        raw = raw.strip()
        if raw and not raw.startswith("WARNING"):
            return normalize(raw)
    return "<no error message>"

def load(fp):
    d = json.load(open(fp))
    return {s["id"]: s for s in d["samples"]}

A = load(args.a); B = load(args.b)
common = sorted(set(A) & set(B))

groups = {"pf":[], "fp":[], "ff":[]}
for i in common:
    a, b = A[i], B[i]
    ok_a, ok_b = a.get("check_ok"), b.get("check_ok")
    if     ok_a and not ok_b: groups["pf"].append((i, b))   # cluster by B's error
    elif not ok_a and     ok_b: groups["fp"].append((i, a)) # cluster by A's error
    elif not ok_a and not ok_b: groups["ff"].append((i, b)) # arbitrary; use B

titles = {
    "pf": f"REGRESSIONS — {args.label_a} PASS, {args.label_b} FAIL (clustering {args.label_b}'s errors)",
    "fp": f"FIXES       — {args.label_a} FAIL, {args.label_b} PASS (clustering {args.label_a}'s errors)",
    "ff": f"BOTH FAIL   — shared hard cases (clustering {args.label_b}'s errors)",
}

for g in ("pf","fp","ff"):
    samples = groups[g]
    print(f"\n{'='*90}\n{titles[g]}   n={len(samples)}\n{'='*90}")
    buckets = Counter(first_err_line(s) for _, s in samples)
    exs = defaultdict(list)
    for i, s in samples:
        exs[first_err_line(s)].append(i)
    for k, n in buckets.most_common(args.top):
        ex_ids = ", ".join(str(i) for i in exs[k][:5])
        print(f"  {n:>3}  {k}")
        print(f"        ex ids: {ex_ids}")
    if len(buckets) > args.top:
        rest = sum(n for _, n in buckets.most_common()[args.top:])
        print(f"  ({len(buckets) - args.top} more buckets, {rest} samples)")
