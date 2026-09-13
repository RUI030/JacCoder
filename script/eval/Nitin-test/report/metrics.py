"""Aggregate metrics over a set of attributed grader rows.

`Row` shape (produced by `build_report.assemble`):
    {
      "problem_id":    str,
      "task":          "completion" | "translation",
      "status":        grader status,
      "attribution":   one of attribute.CATEGORIES,
      "passed_tests":  int,
      "total_tests":   int,
      "compile_ok":    bool,        # jac check succeeded on model code
      "runtime_ok":    bool,        # tests reached without timeout/crash
      "ref_ok":        bool | None, # reference passed on same task_id
    }
"""

from __future__ import annotations

from collections import Counter
from typing import Iterable

import attribute as A


PARTIAL_BUCKETS = ("1-20%", "21-40%", "41-60%", "61-80%", "81-99%")


def _bucket_for(passed: int, total: int) -> str | None:
    if total == 0 or passed == 0 or passed == total:
        return None
    rate = 100.0 * passed / total
    if rate <= 20:  return "1-20%"
    if rate <= 40:  return "21-40%"
    if rate <= 60:  return "41-60%"
    if rate <= 80:  return "61-80%"
    return "81-99%"


def summarize(rows: list[dict]) -> dict:
    """One aggregate summary for a set of rows (already filtered by task if
    caller wants a per-task table)."""
    n = len(rows)
    cats = Counter(r["attribution"] for r in rows)

    compile_ok = sum(1 for r in rows if r["compile_ok"])
    ac_count   = cats.get(A.AC, 0)

    partial_hist: Counter[str] = Counter()
    total_hidden = 0
    passed_hidden = 0
    strict_passed = 0        # hidden tests counted only when runtime finished
    strict_total = 0
    for r in rows:
        total_hidden  += r["total_tests"]
        passed_hidden += r["passed_tests"]
        if r["runtime_ok"] and r["total_tests"]:
            strict_total  += r["total_tests"]
            strict_passed += r["passed_tests"]
        b = _bucket_for(r["passed_tests"], r["total_tests"])
        if b and r["attribution"] == A.PARTIAL_PASS:
            partial_hist[b] += 1

    ac_among_compile = (ac_count / compile_ok) if compile_ok else 0.0
    hidden_pass_rate = (passed_hidden / total_hidden) if total_hidden else 0.0
    strict_score     = (strict_passed / strict_total) if strict_total else 0.0

    ref_scored = [r for r in rows if r["ref_ok"] is not None]
    ref_valid  = sum(1 for r in ref_scored if r["ref_ok"])
    ref_rate   = (ref_valid / len(ref_scored)) if ref_scored else 0.0

    return {
        "n":                       n,
        "compile_ok":              compile_ok,
        "compile_rate":            compile_ok / n if n else 0.0,
        "ac":                      ac_count,
        "ac_rate":                 ac_count / n if n else 0.0,
        "ac_among_compile":        ac_among_compile,
        "all_wrong":               cats.get(A.ALL_WRONG, 0),
        "partial_pass":            cats.get(A.PARTIAL_PASS, 0),
        "hidden_test_pass_rate":   hidden_pass_rate,
        "strict_score":            strict_score,
        "runtime_error_model":     cats.get(A.RUNTIME_ERROR_MODEL, 0),
        "compiler_failure":        cats.get(A.COMPILER_FAILURE, 0),
        "extract_failure":         cats.get(A.EXTRACT_FAILURE, 0),
        "tool_failure":            cats.get(A.TOOL_FAILURE, 0),
        "reference_valid_rate":    ref_rate,
        "reference_valid_count":   f"{ref_valid}/{len(ref_scored)}",
        "partial_buckets":         {b: partial_hist.get(b, 0) for b in PARTIAL_BUCKETS},
    }


def split_by_task(rows: list[dict]) -> dict[str, list[dict]]:
    """Group into completion / translation lists."""
    out: dict[str, list[dict]] = {}
    for r in rows:
        out.setdefault(r["task"], []).append(r)
    return out
