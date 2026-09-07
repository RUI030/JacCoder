"""Pairwise confusion matrix on check_ok between two report.json files.

For matched sample ids: how many pass/fail on each side.
"""
import argparse, json
from pathlib import Path

ap = argparse.ArgumentParser()
ap.add_argument("--a", required=True, help="report.json for adapter A")
ap.add_argument("--b", required=True, help="report.json for adapter B")
ap.add_argument("--label-a", default="A")
ap.add_argument("--label-b", default="B")
ap.add_argument("--show-diff", type=int, default=0, help="print first N ids where A/B disagree")
args = ap.parse_args()

def index(fp):
    d = json.load(open(fp))
    return {s["id"]: bool(s.get("check_ok")) for s in d["samples"]}, d

A, ra = index(args.a); B, rb = index(args.b)
common = sorted(set(A) & set(B))
only_a = sorted(set(A) - set(B))
only_b = sorted(set(B) - set(A))

print(f"{args.label_a}: {ra['pred_file']}")
print(f"{args.label_b}: {rb['pred_file']}")
print(f"n_common={len(common)}  only_{args.label_a}={len(only_a)}  only_{args.label_b}={len(only_b)}\n")

pp = pf = fp = ff = 0
for i in common:
    a, b = A[i], B[i]
    if     a and     b: pp += 1
    elif   a and not b: pf += 1
    elif not a and     b: fp += 1
    else: ff += 1

print(f"           {args.label_b}_pass  {args.label_b}_fail")
print(f"{args.label_a}_pass    {pp:>6}    {pf:>6}   (A passed, {pf} B lost)")
print(f"{args.label_a}_fail    {fp:>6}    {ff:>6}   ({fp} B gained)")
print(f"\n{args.label_a}: {pp+pf}/{len(common)} = {100*(pp+pf)/len(common):.1f}%")
print(f"{args.label_b}: {pp+fp}/{len(common)} = {100*(pp+fp)/len(common):.1f}%")
print(f"agreement: {(pp+ff)}/{len(common)} = {100*(pp+ff)/len(common):.1f}%")
print(f"net change ({args.label_b} - {args.label_a}): {fp - pf:+d}")

if args.show_diff:
    lost = [i for i in common if A[i] and not B[i]][:args.show_diff]
    gained = [i for i in common if not A[i] and B[i]][:args.show_diff]
    print(f"\n{args.label_b} LOST (A pass, B fail) ids: {lost}")
    print(f"{args.label_b} GAINED (A fail, B pass) ids: {gained}")
