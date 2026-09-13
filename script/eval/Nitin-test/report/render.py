"""Render a summary dict (from metrics.summarize) as a Markdown table."""

from __future__ import annotations

from metrics import PARTIAL_BUCKETS


def _pct(x: float) -> str:
    return f"{100.0 * x:.1f}%"


def render_summary_table(name: str, s: dict) -> str:
    lines = [
        f"### {name} — n = {s['n']}",
        "",
        "| metric | value |",
        "|---|---|",
        f"| task count                | {s['n']} |",
        f"| compile rate              | {_pct(s['compile_rate'])} ({s['compile_ok']}/{s['n']}) |",
        f"| AC / pass@1               | {_pct(s['ac_rate'])} ({s['ac']}/{s['n']}) |",
        f"| AC among compile          | {_pct(s['ac_among_compile'])} ({s['ac']}/{s['compile_ok']}) |",
        f"| all-wrong                 | {s['all_wrong']} |",
        f"| partial pass              | {s['partial_pass']} |",
        f"| hidden-testcase pass rate | {_pct(s['hidden_test_pass_rate'])} |",
        f"| strict score              | {_pct(s['strict_score'])} |",
        f"| runtime error (model)     | {s['runtime_error_model']} |",
        f"| compiler failure          | {s['compiler_failure']} |",
        f"| extraction failure        | {s['extract_failure']} |",
        f"| tool failure              | {s['tool_failure']} |",
        f"| reference-valid           | {_pct(s['reference_valid_rate'])} ({s['reference_valid_count']}) |",
        "",
    ]
    return "\n".join(lines)


def render_partial_buckets(name: str, s: dict) -> str:
    row = " | ".join(str(s["partial_buckets"][b]) for b in PARTIAL_BUCKETS)
    header = "| " + " | ".join(PARTIAL_BUCKETS) + " |"
    sep    = "|" + "---|" * len(PARTIAL_BUCKETS)
    return (
        f"### Partial-pass buckets — {name}\n\n"
        f"{header}\n{sep}\n| {row} |\n"
    )


def render_full_report(tables: dict[str, dict]) -> str:
    """`tables` = {name: summary_dict}."""
    out = ["# JacCoder v1.2 SFT — function-eval-v1 test split", ""]
    for name, s in tables.items():
        out.append(render_summary_table(name, s))
    out.append("## Partial-pass histograms\n")
    for name, s in tables.items():
        if s["partial_pass"]:
            out.append(render_partial_buckets(name, s))
    return "\n".join(out)
