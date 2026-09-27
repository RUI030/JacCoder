"""Unit tests for the JacCoder patch on the vendored eval_jac.py
(instrument_tests, parse_pytest_pertest). See PROVENANCE.md.

Run from repo root:
    python script/eval/Nitin-test/graders/test_eval_jac_patch.py

Exit code is non-zero iff any assertion fails. No pytest needed.
"""

from __future__ import annotations

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from eval_jac import instrument_tests, parse_pytest_pertest   # noqa: E402


TESTS = '''test "t0" {
    assert (f(1) == [1, 3]);;
}

test "t1" {
    assert (
        f("a == b;")
        == [1, 2]
    );;
}

test "t2" {
    assert (g("""x
y""") == "x") , "msg";;
}

test "t3" {
    assert (h() == h() == h());;
}
'''

# Trimmed `jac test -v` stdout (jac 0.36.1, pytest + xdist).
STDOUT = '''[gw2] [ 25%] FAILED tests.jac::t2
[gw1] [ 50%] PASSED tests.jac::t1
[gw0] [ 75%] FAILED tests.jac::t0
=================================== FAILURES ===================================
______________________________________ t2 ______________________________________
    raise ValueError("boom");
E   ValueError: boom
______________________________________ t0 ______________________________________
E   AssertionError:
----------------------------- Captured stdout call -----------------------------
@@ACTUAL t0 0 [1, 2]
=========================== short test summary info ============================
FAILED tests.jac::t2 -   /x/_pytest/runner.py:368 in from_call
E   ValueError: boom
FAILED tests.jac::t0 -   /x/_pytest/runner.py:368 in from_call
========================= 2 failed, 1 passed in 1.85s ==========================
'''


def test_instrument_binds_lhs_and_prints():
    out = instrument_tests(TESTS)
    assert "_jaccoder_got0 = f(1);" in out
    assert 'print("@@ACTUAL t0 0 " + repr(_jaccoder_got0));' in out
    assert "assert (_jaccoder_got0 == [1, 3]);;" in out


def test_instrument_ignores_eq_inside_strings_and_keeps_message():
    out = instrument_tests(TESTS)
    assert '_jaccoder_got0 = f("a == b;");' in out
    assert '_jaccoder_got0 = g("""x\ny""");' in out
    assert 'assert (_jaccoder_got0 == "x") , "msg";;' in out


def test_instrument_raw_string_escaped_quote_does_not_close():
    # r"abc'\"def" is one literal: a backslash keeps the quote even in raw strings.
    out = instrument_tests('test "t0" {\n    assert (f(r"abc\'\\"def") == False);;\n}\n')
    assert '_jaccoder_got0 = f(r"abc\'\\"def");' in out
    assert "assert (_jaccoder_got0 == False);;" in out


def test_instrument_leaves_chained_comparison_untouched():
    out = instrument_tests(TESTS)
    assert "assert (h() == h() == h());;" in out


def test_instrument_is_identity_without_asserts():
    src = 'test "t0" {\n    x = 1;\n}\n'
    assert instrument_tests(src) == src


def test_parse_verdicts_errors_actuals():
    rows = {r["name"]: r for r in parse_pytest_pertest(STDOUT, TESTS)}
    assert rows["t0"] == {"name": "t0", "passed": False,
                          "error": "AssertionError:", "actual": "[1, 2]"}
    assert rows["t1"] == {"name": "t1", "passed": True}
    # exception, not an assert: no actual even if an earlier assert printed one
    assert rows["t2"] == {"name": "t2", "passed": False, "error": "ValueError: boom"}
    # never reported (e.g. collection failure) -> None, not True
    assert rows["t3"] == {"name": "t3", "passed": None}


def test_parse_collection_failure_marks_all_none():
    stdout = ("ERROR tests.jac - failed to import Jac test module /tmp/x\n"
              "=============================== 1 error in 2.11s ===\n")
    assert all(r["passed"] is None for r in parse_pytest_pertest(stdout, TESTS))


def test_parse_non_xdist_verbose_lines():
    stdout = "tests.jac::t0 PASSED [ 50%]\ntests.jac::t1 FAILED [100%]\n"
    got = {r["name"]: r["passed"] for r in parse_pytest_pertest(stdout, TESTS)}
    assert got == {"t0": True, "t1": False, "t2": None, "t3": None}


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
