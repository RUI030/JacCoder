"""Mutually-exclusive 7-way attribution over grader rows.

Categories (priority order — first match wins):
  1. tool_failure       — grader itself failed OR reference reproduces failure
  2. extract_failure    — model output had no jac block
  3. compiler_failure   — jac check failed on extracted model code
  4. runtime_error_model— compiled but raised / timed out during hidden tests
  5. all_wrong          — tests ran, 0 passed
  6. partial_pass       — 1..N-1 tests passed
  7. AC                 — final status == pass

Inputs: (model_row, ref_row) — both grader rows keyed by problem_id.
`ref_row` may be None; treated as "reference not evaluated" (never tool_failure).

AC is anchored on final status == "pass", NOT per_test == 100%. A timeout
whose per_test rows show 100% is NOT AC — the grader's final status wins.
Tool failure takes precedence over per-test bucket.
"""

from __future__ import annotations

from typing import Optional


AC                    = "AC"
PARTIAL_PASS          = "partial_pass"
ALL_WRONG             = "all_wrong"
RUNTIME_ERROR_MODEL   = "runtime_error_model"
COMPILER_FAILURE      = "compiler_failure"
EXTRACT_FAILURE       = "extract_failure"
TOOL_FAILURE          = "tool_failure"

CATEGORIES = (
    AC, PARTIAL_PASS, ALL_WRONG,
    RUNTIME_ERROR_MODEL, COMPILER_FAILURE, EXTRACT_FAILURE,
    TOOL_FAILURE,
)


def _passed_total(row: dict) -> tuple[int, int]:
    """(passed, total) hidden-test counts from a grader row's per_test."""
    pt = row.get("per_test") or []
    total = len(pt)
    passed = sum(1 for t in pt if t.get("passed"))
    return passed, total


def _ref_reproduces(model_row: dict, ref_row: Optional[dict]) -> bool:
    """True iff the reference reproduces a model-side failure — i.e. the ref
    itself did not fully pass on the same toolchain. If the model succeeded
    (AC), the tool clearly worked, so this returns False regardless of ref.
    """
    if ref_row is None:
        return False
    return ref_row.get("status") != "pass"


def attribute(model_row: dict, ref_row: Optional[dict]) -> str:
    """Assign one category to a model result row, mutually exclusive."""
    status = model_row.get("status")

    # 1. tool_failure takes precedence, but ONLY when the model also failed.
    #    Grader-side infra_error is always tool_failure (grader broke).
    if status == "infra_error":
        return TOOL_FAILURE
    if status != "pass" and _ref_reproduces(model_row, ref_row):
        return TOOL_FAILURE

    # 7. AC — anchored on final status, not per_test percentage.
    if status == "pass":
        return AC

    # 2. extract failure
    if status == "extract_fail":
        return EXTRACT_FAILURE

    # 3. compiler failure — jac check itself rejected the model code
    if status == "check_fail":
        return COMPILER_FAILURE

    # 4. runtime error — timeout during tests, or crash-in-test (any status
    #    reaching here with check having passed).
    if status == "timeout":
        return RUNTIME_ERROR_MODEL

    # 5 / 6 — tests actually executed; split by per_test.
    passed, total = _passed_total(model_row)
    if total == 0:
        # Compiled but test stage produced no per_test rows — treat as a
        # runtime failure on the model side (crash before any test recorded).
        return RUNTIME_ERROR_MODEL
    if passed == 0:
        return ALL_WRONG
    return PARTIAL_PASS


def build_attribution_map(
    model_rows: list[dict],
    ref_map: dict[str, dict],
) -> dict[str, str]:
    """problem_id → category."""
    return {
        r["problem_id"]: attribute(r, ref_map.get(r["problem_id"]))
        for r in model_rows
    }
