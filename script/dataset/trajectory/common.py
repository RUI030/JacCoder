"""Shared helpers for agent-trajectory converters: redact, loop marking, stats, write, to chat-template input."""

import json, re
from collections import Counter
from pathlib import Path

# Setting =================================================
SECRET = re.compile(r"(sk-ant-[\w-]{20,}|sk-[\w-]{20,}|hf_[A-Za-z0-9]{20,}|gh[pousr]_[A-Za-z0-9]{20,}"
                    r"|AKIA[0-9A-Z]{16}|xox[baprs]-[\w-]{10,})")
EMAIL  = re.compile(r"(?<![\w.+-])(?!git@)[\w.+-]+@(?=[\w-]*[A-Za-z])[\w-]+(?:\.[\w-]+)*\.[A-Za-z]{2,}\b")
EMAIL_KEEP = ("@example.com", "@example.org", "noreply@")  # placeholders and bot addresses are not personal
MODES = {                        # role -> allowed modes; only `assistant` rows are trained on
    "user":      {"prompt", "command"},
    "harness":   {"system", "context", "tool_result"},
    "assistant": {"think", "reply", "tool_call"},
}
LOOP_RUN = 3                     # same tool calls this many responses in a row -> those responses get weight 0

# Functions ===============================================
def redact(obj):
    """Replace secret-looking substrings and email addresses in every string of a nested JSON value."""
    if isinstance(obj, str):
        return EMAIL.sub(lambda m: m.group(0) if any(k in m.group(0) for k in EMAIL_KEEP) else "<EMAIL>",
                         SECRET.sub("<REDACTED>", obj))
    if isinstance(obj, list):
        return [redact(x) for x in obj]
    if isinstance(obj, dict):
        return {k: redact(v) for k, v in obj.items()}
    return obj


def responses(rows: list[dict]) -> list[list[dict]]:
    """Consecutive assistant rows = one model response (one assistant turn).

    Any user or harness row ends a response; a tool call's result is a harness
    row, so calls made after seeing a result always start a new response.
    """
    groups, prev = [], None
    for r in rows:
        if r["role"] == "assistant":
            if prev != "assistant":
                groups.append([])
            groups[-1].append(r)
        prev = r["role"]
    return groups


def mask(response: list[dict], reason: str) -> int:
    """Weight 0 on every row of one response (kept as context, no loss); returns 1 if newly masked."""
    newly = any(r.get("weight", 1) != 0 for r in response)
    for r in response:
        r["weight"] = 0
        r.setdefault("masked", reason)
    return int(newly)


def mark_loops(rows: list[dict]) -> int:
    """Weight 0 on looped responses; returns how many were newly masked.

    A loop is the same tool calls (names + args) LOOP_RUN+ responses in a row,
    or a non-trivial reply repeated verbatim. Looped rows stay in place: later
    rows refer to them, so they are masked, not deleted.
    """
    resp   = responses(rows)
    keys   = [json.dumps([(r["name"], r["args"]) for r in g if r["mode"] == "tool_call"], sort_keys=True)
              for g in resp]
    marked = 0
    run    = 1
    for i in range(1, len(resp)):
        run = run + 1 if keys[i] == keys[i - 1] and keys[i] != "[]" else 1
        if run >= LOOP_RUN:
            marked += sum(mask(g, "loop") for g in resp[i - run + 1 : i + 1])
    seen = set()
    for g in resp:
        text = "\n".join(r["content"] for r in g if r["mode"] == "reply").strip()
        if len(text) > 80 and text in seen:
            marked += mask(g, "loop")
        seen.add(text)
    return marked


def stats(trajs: list[dict]) -> dict:
    """Counts a converter reports next to its output (see README "Stats")."""
    c = Counter()
    for t in trajs:
        c["trajectories"] += 1
        c["subagent_trajectories"] += t["meta"].get("parent") is not None
        for r in t["rows"]:
            c[f"rows_{r['role']}/{r['mode']}"] += 1
            if r["mode"] == "tool_call":
                c[f"tool:{r['name']}"] += 1
            elif r["mode"] == "tool_result":
                c[f"tool_status_{r['status']}"] += 1
        for g in responses(t["rows"]):
            c["responses"] += 1
            if g[0].get("weight", 1) == 0:
                c[f"responses_masked_{g[0].get('masked', '?')}"] += 1
    return dict(sorted(c.items()))


def write_trajectories(trajs: list[dict], out_path, extra_stats: dict | None = None) -> dict:
    """Validate roles/modes, write trajectories as JSONL plus <out>.stats.json; returns the stats."""
    for t in trajs:
        for r in t["rows"]:
            if r["mode"] not in MODES.get(r["role"], ()):
                raise ValueError(f"bad role/mode {r['role']}/{r['mode']} in {t['meta']}")
    out_path = Path(out_path)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    with out_path.open("w", encoding="utf-8") as f:
        for t in trajs:
            f.write(json.dumps(redact(t), ensure_ascii=False) + "\n")
    st = {**stats(trajs), **(extra_stats or {})}
    out_path.with_suffix(".stats.json").write_text(json.dumps(st, indent=2) + "\n")
    return st


def to_template_input(traj: dict, system: str | None) -> list[dict]:
    """Trajectory rows -> the chat messages a HF chat template (Qwen/Ornith) expects.

    Each response becomes one assistant message (`reasoning_content`,
    `content`, `tool_calls`, `weight`). The tool_result rows after it become
    `tool` messages, paired with its calls in order (call ids are generated:
    templates only use them for pairing). `user` and harness `context` rows
    merge into one user turn, as the API sent them. The system prompt goes
    first: a harness `system` row in the trajectory wins over `system`.
    """
    rows    = traj["rows"]
    system  = next((r["content"] for r in rows if r["mode"] == "system"), system)
    msgs    = [{"role": "system", "content": system}] if system else []
    pending = []                     # ids of the last response's calls still waiting for a result
    n_call  = 0
    for r in rows:
        role, mode = r["role"], r["mode"]
        if role == "assistant":
            if msgs and msgs[-1]["role"] == "assistant":   # still the same response (see `responses`)
                m = msgs[-1]
            else:
                m = {"role": "assistant", "content": "", "weight": 1}
                msgs.append(m)
            m["weight"] = min(m["weight"], r.get("weight", 1))
            if mode == "think":
                m["reasoning_content"] = (m.get("reasoning_content", "") + "\n\n" + r["content"]).strip()
            elif mode == "reply":
                m["content"] = (m["content"] + "\n\n" + r["content"]).strip()
            else:
                n_call += 1
                m.setdefault("tool_calls", []).append(
                    {"id": f"call_{n_call}", "type": "function", "function": {"name": r["name"], "arguments": r["args"]}})
                pending.append(f"call_{n_call}")
        elif mode == "tool_result":
            if not pending:
                raise ValueError(f"tool_result without a pending tool_call in {traj['meta']}")
            msgs.append({"role": "tool", "tool_call_id": pending.pop(0), "content": r["content"]})
        elif mode in ("prompt", "command", "context"):
            if msgs and msgs[-1]["role"] == "user":
                msgs[-1]["content"] += "\n\n" + r["content"]
            else:
                msgs.append({"role": "user", "content": r["content"]})
    return msgs

