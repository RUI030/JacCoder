"""Unit tests for the 7-way attribution rule.

Run from repo root:
    python script/eval/Nitin-test/report/test_attribute.py

Exit code is non-zero iff any assertion fails. No pytest needed.
"""

from __future__ import annotations

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from attribute import (                              # noqa: E402
    attribute,
    AC, PARTIAL_PASS, ALL_WRONG,
    RUNTIME_ERROR_MODEL, COMPILER_FAILURE, EXTRACT_FAILURE, TOOL_FAILURE,
)


def _model(status: str, per_test: list[dict] | None = None,
           check_pass: bool = True) -> dict:
    return {"status": status, "per_test": per_test or [],
            "check_pass": check_pass}


def _ref(status: str = "pass") -> dict:
    return {"status": status}


def _pt(n_pass: int, n_total: int) -> list[dict]:
    return [{"name": f"t{i}", "passed": i < n_pass} for i in range(n_total)]


# ------------------------------------------------------------------ 7 core cases
def test_ac_status_pass():
    row = _model("pass", _pt(10, 10))
    assert attribute(row, _ref()) == AC


def test_partial_pass():
    row = _model("test_fail", _pt(3, 10))
    assert attribute(row, _ref()) == PARTIAL_PASS


def test_all_wrong():
    row = _model("test_fail", _pt(0, 10))
    assert attribute(row, _ref()) == ALL_WRONG


def test_runtime_error_timeout():
    row = _model("timeout", _pt(0, 10))
    assert attribute(row, _ref()) == RUNTIME_ERROR_MODEL


def test_compiler_failure():
    row = _model("check_fail", check_pass=False)
    assert attribute(row, _ref()) == COMPILER_FAILURE


def test_extract_failure():
    row = _model("extract_fail", check_pass=False)
    assert attribute(row, _ref()) == EXTRACT_FAILURE


def test_tool_failure_infra():
    """Grader itself broke — always tool_failure regardless of ref."""
    row = _model("infra_error", check_pass=False)
    assert attribute(row, ref_row=None) == TOOL_FAILURE
    assert attribute(row, _ref("pass")) == TOOL_FAILURE


def test_tool_failure_ref_reproduces():
    """Model fails AND ref fails on same task → tool_failure."""
    row = _model("check_fail", check_pass=False)
    assert attribute(row, _ref("check_fail")) == TOOL_FAILURE


# --------------------------------------------------------------- priority edges
def test_timeout_with_100pct_per_test_is_not_ac():
    """A timeout whose per_test rows say 100% must NOT be AC — final status
    wins over per_test bucket."""
    row = _model("timeout", _pt(10, 10))
    assert attribute(row, _ref()) == RUNTIME_ERROR_MODEL


def test_tool_failure_takes_precedence_over_per_test_bucket():
    """Even if per_test looks like partial_pass, a broken ref makes it a
    tool failure (model side is contaminated)."""
    row = _model("test_fail", _pt(5, 10))
    assert attribute(row, _ref("check_fail")) == TOOL_FAILURE


def test_model_ac_never_tool_failure_even_if_ref_failed():
    """If the model got AC, the tool clearly worked for it — never demote
    to tool_failure because the ref happened to fail."""
    row = _model("pass", _pt(10, 10))
    assert attribute(row, _ref("check_fail")) == AC


def test_missing_ref_is_not_tool_failure():
    """ref_row=None means 'reference not evaluated'; treat as absent, not
    reproducing — model owns its failure."""
    row = _model("check_fail", check_pass=False)
    assert attribute(row, ref_row=None) == COMPILER_FAILURE


def test_compiled_but_zero_per_test_rows_is_runtime():
    """test_fail with empty per_test = grader ran tests but recorded none
    → treat as runtime failure on model side."""
    row = _model("test_fail", per_test=[])
    assert attribute(row, _ref()) == RUNTIME_ERROR_MODEL


# ---------------------------------------------------------------------- runner
def _run():
    cases = [v for k, v in globals().items()
             if k.startswith("test_") and callable(v)]
    failed = []
    for fn in cases:
        try:
            fn()
            print(f"ok   {fn.__name__}")
        except AssertionError as e:
            failed.append(fn.__name__)
            print(f"FAIL {fn.__name__}: {e}")
    print(f"\n{len(cases) - len(failed)}/{len(cases)} passed")
    sys.exit(1 if failed else 0)


if __name__ == "__main__":
    _run()
