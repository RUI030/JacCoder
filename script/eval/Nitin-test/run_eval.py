"""Run Nitin's function-eval-v1 suite against a local adapter.

Pipeline:
  public/<split>.jsonl → adapter inference (continuation, no chat fences)
                       → samples.jsonl
                       → graders/eval_jac.py --problems private/<split>.jsonl
                       → out/results.jsonl + summary.json
"""

import argparse
import json
import re
import subprocess
import sys
from datetime import datetime
from pathlib import Path

_HERE = Path(__file__).resolve().parent
_PROJECT_ROOT = _HERE.parent.parent.parent
sys.path.insert(0, str(_PROJECT_ROOT / "script"))

from utils.model import load_model, generate_batched  # noqa: E402


# Model / inference defaults ==================================================
MAX_SEQ_LENGTH     = 16384
MAX_NEW_TOKENS     = 1024
TEMPERATURE        = 0.0
TOP_P              = 0.9
REPETITION_PENALTY = 1.05
ENABLE_THINKING    = False
BATCH_SIZE         = 4

# Continuation prompts are single-turn user messages; the model returns the
# missing Jac continuation as plain text. Any fenced ```jac block is stripped
# before writing samples (eval_jac.py accepts both, but the eval prompts ask
# for no fence).
FENCE_RE = re.compile(r"^```jac\s*\n(.*?)\n```\s*$", re.DOTALL)


def strip_fence(text: str) -> str:
    m = FENCE_RE.match(text.strip())
    return m.group(1) if m else text


def strip_echoed_prefix(completion: str, prefix: str) -> str:
    """Instruct-tuned models often echo the visible prefix back despite the
    'do not repeat the prefix' instruction. Grader then concatenates
    prefix + completion → duplicated signature → compile fail. Strip a leading
    prefix match (verbatim or with whitespace-only differences) if present."""
    if not prefix:
        return completion
    c = completion
    if c.startswith(prefix):
        return c[len(prefix):]
    # Whitespace-tolerant fallback: compare stripped lines.
    p_lines = prefix.splitlines()
    c_lines = c.splitlines()
    if len(c_lines) >= len(p_lines) and \
       all(cl.rstrip() == pl.rstrip() for cl, pl in zip(c_lines[:len(p_lines)], p_lines)):
        return "\n".join(c_lines[len(p_lines):])
    return c


def read_jsonl(path: Path) -> list[dict]:
    with path.open("r", encoding="utf-8") as f:
        return [json.loads(line) for line in f if line.strip()]


def write_jsonl(path: Path, rows: list[dict]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8") as f:
        for r in rows:
            json.dump(r, f, ensure_ascii=False)
            f.write("\n")


def generate_samples(model, tokenizer, prompts: list[dict], limit: int) -> list[dict]:
    if limit:
        prompts = prompts[:limit]
    samples: list[dict] = []
    for i in range(0, len(prompts), BATCH_SIZE):
        chunk = prompts[i : i + BATCH_SIZE]
        messages_list = [[{"role": "user", "content": p["prompt"]}] for p in chunk]
        replies = generate_batched(
            model, tokenizer, messages_list,
            max_new_tokens=MAX_NEW_TOKENS,
            temperature=TEMPERATURE,
            top_p=TOP_P,
            repetition_penalty=REPETITION_PENALTY,
            enable_thinking=ENABLE_THINKING,
        )
        for p, reply in zip(chunk, replies):
            body = strip_echoed_prefix(strip_fence(reply), p.get("prefix", ""))
            samples.append({
                "problem_id": p["id"],
                "sample_id":  0,
                "completion": body,
            })
        done = min(i + BATCH_SIZE, len(prompts))
        if done % 20 == 0 or done == len(prompts):
            print(f"  generated {done}/{len(prompts)}", flush=True)
    return samples


def main():
    cli = argparse.ArgumentParser()
    cli.add_argument("--adapter", required=True,
                     help="local adapter dir (auto-merged in load_model)")
    cli.add_argument("--split", choices=("dev", "test"), default="dev",
                     help="which public/private split to run")
    cli.add_argument("--limit", type=int, default=0,
                     help="stop after N prompts (0 = all)")
    cli.add_argument("--only-ids", type=Path, default=None,
                     help="text file of problem ids (one per line) to keep; "
                          "typically wash_refs.py's refs_ok.txt")
    cli.add_argument("--k", default="1", help="pass@k values, comma-separated")
    cli.add_argument("--workers", type=int, default=2, help="grader workers")
    args = cli.parse_args()

    public_fp  = _HERE / "data" / "function" / "v1" / "public"  / f"{args.split}.jsonl"
    private_fp = _HERE / "data" / "function" / "v1" / "private" / f"{args.split}.jsonl"
    grader     = _HERE / "graders" / "eval_jac.py"

    tag  = Path(args.adapter).parent.name if args.adapter else "base"
    stamp = datetime.now().strftime("%m-%d_%H-%M")
    out_dir = _HERE / "out" / f"{tag}_{args.split}_{stamp}"
    samples_fp = out_dir / "samples.jsonl"

    print(f"Adapter : {args.adapter}")
    print(f"Split   : {args.split}  (prompts={public_fp}, hidden={private_fp})")
    print(f"Output  : {out_dir}")

    model, tokenizer = load_model(args.adapter, MAX_SEQ_LENGTH, load_in_4bit=True)

    prompts = read_jsonl(public_fp)
    if args.only_ids:
        keep = {ln.strip() for ln in args.only_ids.read_text().splitlines() if ln.strip()}
        before = len(prompts)
        prompts = [p for p in prompts if p["id"] in keep]
        print(f"Filtered by --only-ids: {before} → {len(prompts)}")
    samples = generate_samples(model, tokenizer, prompts, args.limit)
    write_jsonl(samples_fp, samples)
    print(f"Wrote {len(samples)} samples → {samples_fp}")

    print("\nGrading…")
    subprocess.run(
        [
            sys.executable, str(grader),
            "--problems", str(private_fp),
            "--samples",  str(samples_fp),
            "--out-dir",  str(out_dir),
            "--k",        args.k,
            "--workers",  str(args.workers),
        ],
        check=True,
    )
    print(f"\nSummary: {out_dir / 'summary.json'}")


if __name__ == "__main__":
    main()
