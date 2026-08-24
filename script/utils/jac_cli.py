"""Thin wrappers around the `jac` CLI: check / run / build / start."""

import socket, subprocess, tempfile, time, urllib.request
from contextlib import contextmanager
from pathlib import Path

JAC             = "jac"
DEFAULT_TIMEOUT = 30
START_BOOT      = 5
HTTP_TIMEOUT    = 10


def _run(args, timeout=DEFAULT_TIMEOUT, cwd=None) -> tuple[bool, str]:
    """Return (ok, stderr_or_stdout). ok is True iff exit code 0."""
    try:
        proc = subprocess.run(
            [JAC, *args],
            capture_output=True, text=True,
            timeout=timeout, cwd=cwd,
        )
        return proc.returncode == 0, (proc.stderr or proc.stdout).strip()
    except subprocess.TimeoutExpired:
        return False, "timeout"


@contextmanager
def jac_tempfile(source: str):
    """Write source to a temporary .jac file; unlink on exit."""
    with tempfile.NamedTemporaryFile(
        mode="w", suffix=".jac", delete=False, encoding="utf-8"
    ) as fp:
        fp.write(source)
        path = Path(fp.name)
    try:
        yield path
    finally:
        path.unlink(missing_ok=True)


def check(source: str, timeout=DEFAULT_TIMEOUT) -> tuple[bool, str]:
    """Static type check via `jac check`."""
    with jac_tempfile(source) as p:
        return _run(["check", str(p)], timeout)


def run(source: str, timeout=DEFAULT_TIMEOUT) -> tuple[bool, str]:
    """Execute via `jac run`."""
    with jac_tempfile(source) as p:
        return _run(["run", str(p)], timeout)


def build(source: str, timeout=DEFAULT_TIMEOUT) -> tuple[bool, str]:
    """Compile via `jac build`."""
    with jac_tempfile(source) as p:
        return _run(["build", str(p)], timeout)


def _free_port() -> int:
    s = socket.socket()
    s.bind(("", 0))
    port = s.getsockname()[1]
    s.close()
    return port


def start_http_check(
    source: str,
    path: str = "/",
    boot: float = START_BOOT,
    timeout: float = HTTP_TIMEOUT,
) -> tuple[bool, str]:
    """Spin up `jac start`, hit `path`, return (ok, detail)."""
    with jac_tempfile(source) as p:
        port = _free_port()
        proc = subprocess.Popen(
            [JAC, "start", str(p), "--port", str(port)],
            stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True,
        )
        try:
            time.sleep(boot)
            try:
                url = f"http://127.0.0.1:{port}{path}"
                with urllib.request.urlopen(url, timeout=timeout) as resp:
                    ok = resp.status == 200
                    return ok, f"status={resp.status}"
            except Exception as exc:
                return False, f"{type(exc).__name__}: {exc}"
        finally:
            proc.terminate()
            try:
                proc.wait(timeout=3)
            except subprocess.TimeoutExpired:
                proc.kill()
