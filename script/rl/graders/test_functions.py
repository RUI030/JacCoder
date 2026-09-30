"""Grader self-test for the functions task type: plain asserts, run before every RL run.

Run from repo root:
    python script/rl/graders/test_functions.py [--set dataset/rl/functions/spike-sample-20] [--workers 6]

Exit code is non-zero iff an assertion fails. Also prints the planted runaway cases
(timeout, memory cap, spawned child) graded in parallel, with peak host RAM and the
size of jac's postgres dir.
"""

import argparse, subprocess, sys, threading, time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[2]))
from utils import jac_cli
from rl.graders import functions, grade_completion, grade_many, tests_dir_of

# Setting =================================================
SET_DIR = "dataset/rl/functions/spike-sample-20"
WORKERS = 6
TIMEOUT = 10
MEM_GB  = 1
TASK    = "rle_encode"
CHILD   = "313"                                  # unique `sleep` argument to find a leaked child

cli = argparse.ArgumentParser(add_help=False)
cli.add_argument("--set",     dest="set_dir")
cli.add_argument("--workers", dest="workers", type=int)
args, _ = cli.parse_known_args()
if args.set_dir: SET_DIR = args.set_dir
if args.workers: WORKERS = args.workers

TASK_DIRS = sorted(p for p in (Path(SET_DIR) / "tasks").iterdir() if p.is_dir())
TASK_DIR  = Path(SET_DIR) / "tasks" / TASK
META      = {"target": "main.jac"}

PLANTED = {
    "timeout": "def rle_encode(s: str) -> str {\n    while True { s = s + \"\"; }\n    return s;\n}\n",
    "memory_cap": "def rle_encode(s: str) -> str {\n    big = [0] * (10 ** 9);\n    return str(len(big));\n}\n",
    # A child in the same process group must die with it when the timeout fires.
    "child": ("import subprocess;\n\ndef rle_encode(s: str) -> str {\n"
              f"    _ = subprocess.Popen([\"sleep\", \"{CHILD}\"]);\n"
              "    while True { s = s + \"\"; }\n    return s;\n}\n"),
}


# Functions ===============================================
def fenced(source: str) -> str:
    return f"Here is the file.\n\n```jac\n{source}\n```\n"


def grade_file(source: str, task_dir: Path = TASK_DIR) -> dict:
    return functions.grade({"main.jac": source}, tests_dir_of(task_dir), META, TIMEOUT, MEM_GB << 30)


def test_solutions_full_reward():
    rows = grade_many([(fenced((tests_dir_of(t) / "solution.jac").read_text()), t) for t in TASK_DIRS],
                      WORKERS, TIMEOUT, MEM_GB)
    for t, r in zip(TASK_DIRS, rows):
        assert r["status"] == "pass" and r["reward"] == 1.0, (t.name, r)
        assert r["total"] >= 4, (t.name, r["total"])
    print(f"  solutions: {len(rows)} pass, grade ms max {max(r['ms'] for r in rows)}")


def test_starters_below_one():
    rows = grade_many([(fenced((t / "starter.jac").read_text()), t) for t in TASK_DIRS], WORKERS, TIMEOUT, MEM_GB)
    for t, r in zip(TASK_DIRS, rows):
        assert r["check_pass"] and r["reward"] < 1.0, (t.name, r)
    print("  starters:", " ".join(f"{t.name}={r['passed']}/{r['total']}" for t, r in zip(TASK_DIRS, rows)))


def test_broken_file_zero():
    r = grade_completion(fenced("def rle_encode(s: str) -> str {\n    return s\n"), TASK_DIR, TIMEOUT, MEM_GB)
    assert r["status"] == "check_fail" and r["reward"] == 0.0, r


def test_format_rules():
    sol = (tests_dir_of(TASK_DIR) / "solution.jac").read_text()
    cases = {
        "no block":        "def rle_encode(s: str) -> str { return s; }",
        "two blocks":      fenced(sol) + fenced(sol),
        "own test block":  fenced(sol + '\ntest "sneaky" { assert True; }\n'),
        "forbidden import": fenced("import os;\n" + sol),
        "py escape":       fenced(sol + "\n::py::\nimport os\n::py::\n"),
    }
    for name, text in cases.items():
        r = grade_completion(text, TASK_DIR, TIMEOUT, MEM_GB)
        assert r["status"] == "format_fail" and r["reward"] == 0.0, (name, r)
    # Prose and a closed reasoning block around one fence are fine.
    r = grade_completion("<think>try ```jac\nx\n```</think>\n" + fenced(sol), TASK_DIR, TIMEOUT, MEM_GB)
    assert r["status"] == "pass", r


def test_only_hidden_names_count():
    # Test blocks slipped in without the format screen still can't add passes.
    sol = (tests_dir_of(TASK_DIR) / "solution.jac").read_text()
    r = grade_file(sol.replace("return \"\";", "return \"x\";") + '\ntest "sneaky" { assert True; }\n')
    assert r["passed"] == r["total"] - 1, r


def peak_ram_during(fn) -> tuple[object, float]:
    """Run fn() while sampling host used RAM (MemTotal - MemAvailable); return (result, peak GB)."""
    peak, done = [0.0], threading.Event()

    def sample():
        while not done.is_set():
            info = dict(line.split(":") for line in Path("/proc/meminfo").read_text().splitlines())
            used = (int(info["MemTotal"].split()[0]) - int(info["MemAvailable"].split()[0])) / (1 << 20)
            peak[0] = max(peak[0], used)
            time.sleep(0.2)

    th = threading.Thread(target=sample)
    th.start()
    try:
        return fn(), peak[0]
    finally:
        done.set()
        th.join()


def test_planted_runaways_parallel():
    kinds = list(PLANTED) * 2
    base = Path("/proc/meminfo").read_text()
    t0 = time.perf_counter()

    def run():
        out = [None] * len(kinds)
        ths = [threading.Thread(target=lambda i=i: out.__setitem__(i, grade_file(PLANTED[kinds[i]])))
               for i in range(len(kinds))]
        [t.start() for t in ths]
        [t.join() for t in ths]
        return out

    rows, peak = peak_ram_during(run)
    for kind, r in zip(kinds, rows):
        want = "memory_cap" if kind == "memory_cap" else "timeout"
        assert r["status"] == want and r["reward"] == 0.0, (kind, r)
    time.sleep(1)
    leaked = subprocess.run(["pgrep", "-f", f"sleep {CHILD}"], capture_output=True, text=True).stdout.split()
    assert not leaked, f"spawned child survived: {leaked}"
    total = int(base.split("MemTotal:")[1].split()[0]) / (1 << 20)
    print(f"  planted x{len(kinds)} in parallel: {time.perf_counter() - t0:.1f}s, peak host RAM {peak:.1f}/{total:.0f} GB, "
          f"scopes={jac_cli.scopes_available()}, pg {jac_cli.pg_size_bytes() / 1e6:.0f} MB")


def test_rss_watchdog_fallback():
    # Force the no-systemd path (containers) and check the watchdog labels the kill the same way.
    saved = jac_cli._SCOPES_OK
    jac_cli._SCOPES_OK = False
    try:
        r = grade_file(PLANTED["memory_cap"])
        assert r["status"] == "memory_cap", r
    finally:
        jac_cli._SCOPES_OK = saved


# Run =====================================================
if __name__ == "__main__":
    jac_cli.start_pg()                               # postgres outside any per-test cgroup
    tests = [v for k, v in dict(globals()).items() if k.startswith("test_") and callable(v)]
    failed = 0
    for fn in tests:
        t0 = time.perf_counter()
        try:
            fn()
            print(f"PASS {fn.__name__} ({time.perf_counter() - t0:.1f}s)")
        except AssertionError as exc:
            failed += 1
            print(f"FAIL {fn.__name__}: {exc}")
    print(f"pg dir after run: {jac_cli.pg_size_bytes() / 1e6:.0f} MB")
    sys.exit(1 if failed else 0)
