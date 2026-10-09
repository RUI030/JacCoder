"""Claude Code session logs (~/.claude/projects) -> trajectory JSONL (see README.md)."""

import argparse, json, re
import sys
from collections import Counter
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from dataset.trajectory.common import mark_loops, mask, write_trajectories

# Setting =================================================
HARNESS = "claude"
DS_ROOT = f"{Path(__file__).resolve().parent}/../../../dataset"
IN_DIR  = Path.home() / ".claude/projects"
OUT     = f"{DS_ROOT}/raw/trajectory/{HARNESS}.jsonl"

# Harness bookkeeping the model either never sees or that carries no task signal.
SKIP_ATTACHMENTS = {
    "total_tokens_reminder", "output_style", "output_style_instructions", "deferred_tools_delta",
    "deferred_tools_record", "skill_listing", "agent_listing_delta", "mcp_instructions_delta",
    "auto_mode", "model", "command_permissions", "credential_org", "prompt_snapshot",
    "silent_turn_reminder", "thinking_drop", "remote_session_change", "bridge_status",
    "date", "task_reminder",
    "environment", "session_context",    # Claude's env block / cwd updates; user email + git status (private)
}
# Slash commands (/clear, /model, /mcp, /compact, …) and their output: the model is told not to respond to them.
LOCAL_COMMAND = ("<command-name>", "<command-message>", "<command-args>", "<local-command-stdout>",
                 "<local-command-stderr>", "<local-command-caveat>")
USER_COMMAND  = ("[Request interrupted", "<bash-input>")             # user actions the model sees
HARNESS_TEXT  = ("<system-reminder>", "<task-notification>", "<bash-stdout>", "<bash-stderr>")
TASK_NOTICE   = re.compile(r"<task-notification>.*?<task-id>([^<]+)</task-id>(?:.*?<tool-use-id>([^<]+)</tool-use-id>)?", re.S)
TASK_ID_KEYS  = ("backgroundTaskId", "taskId", "agentId")             # toolUseResult fields of calls that start a task

# Functions ===============================================
def load_records(fp: Path) -> list[dict]:
    """JSONL records; a session being written can end in a partial line."""
    out = []
    for line in fp.open(encoding="utf-8"):
        try:
            out.append(json.loads(line))
        except json.JSONDecodeError:
            pass
    return out


def active_path(recs: list[dict]) -> tuple[list[dict], int]:
    """Records on the branch the session ended on, root first; plus the number of abandoned branches.

    The log is a tree (uuid/parentUuid): a rewind or retry adds a sibling. The
    leaf is the last `last-prompt.leafUuid`. A compact_boundary has no parent
    and points back through `logicalParentUuid`.
    """
    by_uuid = {r["uuid"]: r for r in recs if r.get("uuid")}
    order   = [r["uuid"] for r in recs if r.get("uuid")]
    pos     = {u: i for i, u in enumerate(order)}
    leaves  = [r["leafUuid"] for r in recs if r.get("type") == "last-prompt" and r.get("leafUuid") in by_uuid]
    leaf    = leaves[-1] if leaves else (order[-1] if order else None)
    path, seen = [], set()
    while leaf in by_uuid and leaf not in seen:
        seen.add(leaf)
        r = by_uuid[leaf]
        path.append(r)
        leaf = r.get("parentUuid") or r.get("logicalParentUuid")
        if leaf and leaf not in by_uuid and pos[r["uuid"]] > 0:
            leaf = order[pos[r["uuid"]] - 1]   # parent was on a corrupt line: fall back to file order
    # Parallel tool results hang off sibling records, so they are not branches.
    kids = Counter(r.get("parentUuid") for r in by_uuid.values()
                   if r.get("type") != "user" or not is_tool_result(r))
    return path[::-1], sum(1 for n in kids.values() if n > 1)


def is_tool_result(r: dict) -> bool:
    c = r.get("message", {}).get("content")
    return isinstance(c, list) and any(b.get("type") == "tool_result" for b in c)


def block_text(content) -> str:
    """Tool-result / user content (string or block list) -> plain text; images become [image]."""
    if isinstance(content, str):
        return content
    parts = []
    for b in content or []:
        if b.get("type") == "text":
            parts.append(b["text"])
        elif b.get("type") == "image":
            parts.append("[image]")
        elif b.get("type") == "tool_reference":
            parts.append(f"[tool_reference: {b.get('tool_name', '')}]")
    return "\n".join(parts)


def user_rows(r: dict, tasks: dict) -> list[dict]:
    """A `user` record -> user/prompt, user/command and harness/context rows (tool results go after their call)."""
    content = r["message"]["content"]
    blocks  = [{"type": "text", "text": content}] if isinstance(content, str) else content
    out = []
    for b in blocks:
        if b.get("type") == "tool_result":
            continue
        text = block_text([b]).strip()
        if not text or text.startswith(LOCAL_COMMAND):
            continue
        if text.startswith(USER_COMMAND):
            out.append({"role": "user", "mode": "command", "content": text})
        elif r.get("isMeta") or r.get("isCompactSummary") or text.startswith(HARNESS_TEXT):
            out.append(context_row(text, tasks))  # skill bodies, summaries, notices
        else:
            out.append({"role": "user", "mode": "prompt", "content": text})
    return out


def attachment_row(r: dict, tasks: dict) -> dict | None:
    """An attachment record -> one harness/context row with the text the model saw, or None."""
    if r["attachment"].get("type") in SKIP_ATTACHMENTS or not isinstance(r.get("rendered"), list):
        return None
    text = "\n".join(x["content"] for x in r["rendered"] if isinstance(x.get("content"), str)).strip()
    return context_row(text, tasks) if text else None


def context_row(text: str, tasks: dict) -> dict:
    """A harness/context row; a background-task notification gets `ref` = the id of the tool call that
    started the task (its own <tool-use-id>, else looked up from <task-id>)."""
    row = {"role": "harness", "mode": "context", "content": text}
    m = TASK_NOTICE.search(text)
    if m and (m.group(2) or m.group(1) in tasks):
        row["ref"] = m.group(2) or tasks[m.group(1)]
    return row


def task_starts(recs: list[dict]) -> dict:
    """task id -> id of the tool call that started it (background Bash, Monitor, async Agent)."""
    out = {}
    for r in recs:
        res = r.get("toolUseResult")
        if isinstance(res, dict) and is_tool_result(r):
            call = next(b["tool_use_id"] for b in r["message"]["content"] if b.get("type") == "tool_result")
            for k in TASK_ID_KEYS:
                if isinstance(res.get(k), str):
                    out[res[k]] = call
    return out


def response_rows(group: list[dict], results: dict) -> list[dict]:
    """All records of one API response (shared message.id) -> its assistant rows, then one
    harness/tool_result row per call in call order; [] drops the response."""
    model = group[0]["message"].get("model", "")
    if not model.startswith("claude-") or any(g.get("isApiErrorMessage") or g.get("isAbortedMidStream")
                                              for g in group):
        return []
    asst, out = [], []
    for g in group:
        for b in g["message"]["content"]:
            if b["type"] == "thinking" and b["thinking"].strip():
                asst.append({"role": "assistant", "mode": "think", "content": b["thinking"].strip()})  # redacted: dropped
            elif b["type"] == "text" and b["text"].strip():
                asst.append({"role": "assistant", "mode": "reply", "content": b["text"]})
            elif b["type"] == "tool_use":
                asst.append({"role": "assistant", "mode": "tool_call", "id": b["id"], "name": b["name"], "args": b["input"]})
                out.append(tool_result_row(b["id"], results))
    if any(r["status"] == "denied" for r in out):
        mask(asst, "denied")
    return asst + out


def tool_result_row(call_id: str, results: dict) -> dict:
    """The tool_result for one call (looked up by id; parallel results are not on the active chain)."""
    block, rec = results.get(call_id, (None, {}))
    status = ("missing" if block is None else "denied" if rec.get("toolDenialKind")
              else "error" if block.get("is_error") else "ok")
    return {"role": "harness", "mode": "tool_result", "content": block_text(block.get("content")) if block else "",
            "status": status}


def segments(path: list[dict], results: dict, tasks: dict) -> list[tuple[list[dict], Counter]]:
    """Active path -> (rows, models used) per compaction segment."""
    segs, i = [([], Counter())], 0
    while i < len(path):
        r, kind = path[i], path[i].get("type")
        rows, models = segs[-1]
        if kind == "system" and r.get("subtype") == "compact_boundary":
            segs.append(([], Counter()))
        elif kind == "attachment":
            row = attachment_row(r, tasks)
            if row:
                rows.append(row)
        elif kind == "user":
            rows.extend(user_rows(r, tasks))
        elif kind == "assistant":
            group = [r]
            while (i + 1 < len(path) and path[i + 1].get("type") == "assistant"
                   and path[i + 1]["message"]["id"] == r["message"]["id"]):
                i += 1
                group.append(path[i])
            resp = response_rows(group, results)
            if resp:
                models[group[0]["message"]["model"]] += 1
                rows.extend(resp)
        i += 1
    return segs


def convert_file(fp: Path, parent: dict | None) -> tuple[list[dict], dict]:
    """One session (or subagent) log -> trajectories (one per segment that has a model response)."""
    recs    = load_records(fp)
    results = {b["tool_use_id"]: (b, r) for r in recs if r.get("type") == "user" and is_tool_result(r)
               for b in r["message"]["content"] if b.get("type") == "tool_result"}
    path, n_branch = active_path(recs)
    session = parent["session_id"] if parent else fp.stem
    trajs   = []
    for k, (rows, models) in enumerate(segments(path, results, task_starts(recs))):
        if not models or next(r for r in rows if r["role"] != "harness")["role"] != "user":
            continue                     # chat templates need a human query before the first reply
        mark_loops(rows)
        meta = {"harness": HARNESS, "model": models.most_common(1)[0][0], "session_id": session,
                "segment": k, "parent": parent}
        if parent:
            meta["agent_id"] = fp.stem
        trajs.append({"meta": meta, "rows": rows})
    return trajs, {"abandoned_branches": n_branch}


def subagent_parent(fp: Path) -> dict:
    """subagents/agent-X.jsonl -> link to the parent session and the tool call that spawned it."""
    side = fp.with_suffix(".meta.json")
    info = json.loads(side.read_text()) if side.exists() else {}
    return {"session_id": fp.parent.parent.name, "tool_call_id": info.get("toolUseId"),
            "agent_type": info.get("agentType")}


def convert(in_dir=IN_DIR, out=OUT, project: str | None = None):
    """Convert every session (and subagent) under in_dir, write JSONL + stats."""
    projects = sorted(Path(in_dir).glob(project or "*"))
    trajs, extra = [], Counter()
    for proj in projects:
        for fp in sorted(proj.glob("*.jsonl")):
            t, st = convert_file(fp, None)
            trajs += t
            extra.update(st)
            extra["sessions"] += 1
        for fp in sorted(proj.glob("*/subagents/*.jsonl")):
            t, _ = convert_file(fp, subagent_parent(fp))
            trajs += t
    st = write_trajectories(trajs, out, dict(extra))
    print(json.dumps(st, indent=2))
    print(f"Wrote {len(trajs)} trajectories to {out}")


# Run =====================================================
if __name__ == "__main__":
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--in-dir",  default=str(IN_DIR))
    ap.add_argument("--out",     default=OUT)
    ap.add_argument("--project", help="glob over project dir names, e.g. '*JacCoder'")
    args = ap.parse_args()
    convert(args.in_dir, args.out, args.project)
