"""Grader for single-function tasks: `jac check`, then the hidden tests; reward = passed / total."""

import re, time
from pathlib import Path

from utils import jac_cli

# Setting =================================================
TESTS_FILE = "tests.jac"
TEST_NAME  = re.compile(r'(?m)^\s*test\s+"([^"]+)"')
EXPECTED   = re.compile(r"^AssertionError: expected=(.*?) actual=(.*)$")   # message format used in tests.jac


# Functions ===============================================
def hidden_names(tests_src: str) -> list[str]:
    """Test names declared in tests.jac; only these count, whatever else `jac test` reports."""
    return TEST_NAME.findall(tests_src)


def per_test(names: list[str], verdicts: dict[str, bool], messages: dict[str, str]) -> list[dict]:
    """One entry per hidden test; failed ones carry the error and, for asserts, expected / actual reprs."""
    rows = []
    for n in names:
        row = {"name": n, "passed": verdicts.get(n)}
        if not verdicts.get(n):
            err = messages.get(n, "")
            m = EXPECTED.match(err)
            row.update({"expected": m.group(1), "actual": m.group(2)} if m else {"error": err})
        rows.append(row)
    return rows


def grade(files: dict[str, str], tests_dir: str | Path, meta: dict, timeout: float,
          mem_limit_bytes: int | None = None) -> dict:
    """Grade one materialized completion.

    Writes `files`, tests.jac and the server-codespace jac.toml into a temp workspace, then:
    check fails → check_fail / 0; timeout → 0; memory cap → 0; postgres or launch
    failure → infra_error / None (not the model's fault); else passed / total.
    Graded rows also get `per_test` (name, passed, and expected / actual for failed asserts).
    """
    start = time.perf_counter()
    tests_src = (Path(tests_dir) / TESTS_FILE).read_text()
    names = hidden_names(tests_src)
    ws_files = {**files, TESTS_FILE: tests_src, "jac.toml": jac_cli.SERVER_TOML}
    row = {"status": None, "check_pass": False, "passed": 0, "total": len(names), "reward": 0.0, "detail": ""}
    with jac_cli.jac_workspace(ws_files) as ws:
        ok, text = jac_cli.check_path(meta["target"], ws, timeout)
        if not ok:
            infra = text != "timeout" and jac_cli.INFRA_ERROR.search(text)
            row.update(status="infra_error" if infra else "check_fail", reward=None if infra else 0.0, detail=text[-600:])
        else:
            row["check_pass"] = True
            res, verdicts = jac_cli.test(TESTS_FILE, ws, timeout, mem_limit_bytes)
            passed = sum(verdicts.get(n, False) for n in names)
            row.update(passed=passed, detail=(res.stdout + res.stderr)[-600:],
                       per_test=per_test(names, verdicts, jac_cli.failure_messages(res.stdout)))
            if res.timed_out:
                row.update(status="timeout")
            elif res.mem_capped:
                row.update(status="memory_cap")
            elif res.infra_error and passed < len(names):
                row.update(status="infra_error", reward=None)
            else:
                row.update(status="pass" if passed == len(names) else "test_fail", reward=passed / len(names))
    row["ms"] = round((time.perf_counter() - start) * 1000)
    return row
