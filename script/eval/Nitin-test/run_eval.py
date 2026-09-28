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
import urllib.request
from concurrent.futures import ThreadPoolExecutor
from datetime import datetime
from pathlib import Path

_HERE = Path(__file__).resolve().parent
_PROJECT_ROOT = _HERE.parent.parent.parent
sys.path.insert(0, str(_PROJECT_ROOT / "script"))



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


def expand_jobs(prompts: list[dict], limit: int, n_samples: int) -> list[tuple[dict, int]]:
    """(prompt, sample_id) pairs; `limit` counts problems, not samples."""
    if limit:
        prompts = prompts[:limit]
    return [(p, sid) for p in prompts for sid in range(n_samples)]


def to_sample(p: dict, sid: int, reply: str) -> dict:
    return {
        "problem_id": p["id"],
        "sample_id":  sid,
        "completion": strip_echoed_prefix(strip_fence(reply), p.get("prefix", "")),
    }


def generate_samples(model, tokenizer, prompts: list[dict], limit: int,
                     n_samples: int, temperature: float) -> list[dict]:
    from utils.model import generate_batched  # noqa: E402  (torch/unsloth: HF path only)
    jobs = expand_jobs(prompts, limit, n_samples)
    samples: list[dict] = []
    for i in range(0, len(jobs), BATCH_SIZE):
        chunk = jobs[i : i + BATCH_SIZE]
        messages_list = [[{"role": "user", "content": p["prompt"]}] for p, _ in chunk]
        replies = generate_batched(
            model, tokenizer, messages_list,
            max_new_tokens=MAX_NEW_TOKENS,
            temperature=temperature,
            top_p=TOP_P,
            repetition_penalty=REPETITION_PENALTY,
            enable_thinking=ENABLE_THINKING,
        )
        samples.extend(to_sample(p, sid, reply) for (p, sid), reply in zip(chunk, replies))
        done = min(i + BATCH_SIZE, len(jobs))
        if done % 20 == 0 or done == len(jobs):
            print(f"  generated {done}/{len(jobs)}", flush=True)
    return samples


def generate_samples_http(base_url: str, prompts: list[dict], limit: int, workers: int,
                          n_samples: int, temperature: float) -> list[dict]:
    """Same as generate_samples, but via an OpenAI-compatible server (e.g. llama-server
    serving a GGUF). Stdlib only, so it runs under a Python without torch/unsloth."""
    jobs = expand_jobs(prompts, limit, n_samples)
    url = f"{base_url.rstrip('/')}/chat/completions"

    def one(job: tuple[dict, int]) -> dict:
        p, sid = job
        body = json.dumps({
            "model": "local",
            "messages": [{"role": "user", "content": p["prompt"]}],
            "max_tokens": MAX_NEW_TOKENS,
            "temperature": temperature,
            "top_p": TOP_P,
            "repeat_penalty": REPETITION_PENALTY,
        }).encode()
        req = urllib.request.Request(url, body, {"Content-Type": "application/json"})
        with urllib.request.urlopen(req, timeout=1800) as r:
            reply = json.load(r)["choices"][0]["message"]["content"] or ""
        return to_sample(p, sid, reply)

    samples: list[dict] = []
    with ThreadPoolExecutor(max_workers=workers) as pool:
        for s in pool.map(one, jobs):                 # map keeps prompt order
            samples.append(s)
            if len(samples) % 20 == 0 or len(samples) == len(jobs):
                print(f"  generated {len(samples)}/{len(jobs)}", flush=True)
    return samples


def main():
    cli = argparse.ArgumentParser()
    cli.add_argument("--adapter", default=None,
                     help="local adapter dir (loaded via utils.model.load_model)")
    cli.add_argument("--base-url", default=None,
                     help="OpenAI-compatible server instead of --adapter, e.g. "
                          "http://127.0.0.1:8080/v1 (llama-server + GGUF)")
    cli.add_argument("--tag", default=None, help="output dir tag (default: adapter run name)")
    cli.add_argument("--gen-workers", type=int, default=16,
                     help="concurrent requests with --base-url (match llama-server -np)")
    cli.add_argument("--split", choices=("dev", "test"), default="dev",
                     help="which public/private split to run")
    cli.add_argument("--limit", type=int, default=0,
                     help="stop after N prompts (0 = all)")
    cli.add_argument("--only-ids", type=Path, default=None,
                     help="text file of problem ids (one per line) to keep; "
                          "typically wash_refs.py's refs_ok.txt")
    cli.add_argument("--n-samples", type=int, default=1,
                     help="completions per problem; >1 needs --temperature > 0")
    cli.add_argument("--temperature", type=float, default=TEMPERATURE,
                     help="0 = greedy; match the RL rollout temperature when "
                          "measuring pass@k for RL readiness")
    cli.add_argument("--k", default="1",
                     help="pass@k values, comma-separated; each k must be <= --n-samples")
    cli.add_argument("--workers", type=int, default=2, help="grader workers")
    cli.add_argument("--timeout", type=float, default=300.0,
                     help="per-stage seconds; grader default is 120")
    args = cli.parse_args()
    if bool(args.adapter) == bool(args.base_url):
        cli.error("pass exactly one of --adapter / --base-url")
    if args.n_samples < 1:
        cli.error("--n-samples must be >= 1")
    if args.n_samples > 1 and args.temperature <= 0:
        cli.error("--n-samples > 1 with greedy decoding gives identical samples; "
                  "set --temperature > 0")
    if max(int(k) for k in args.k.split(",")) > args.n_samples:
        cli.error(f"--k {args.k} exceeds --n-samples {args.n_samples}")

    public_fp  = _HERE / "data" / "function" / "v1" / "public"  / f"{args.split}.jsonl"
    private_fp = _HERE / "data" / "function" / "v1" / "private" / f"{args.split}.jsonl"
    grade_stream = _HERE / "graders" / "grade_stream.py"

    tag  = args.tag or (Path(args.adapter).parent.name if args.adapter else "base")
    if args.temperature > 0:
        tag += f"_n{args.n_samples}_t{args.temperature:g}"
    stamp = datetime.now().strftime("%m-%d_%H-%M")
    out_dir = _HERE / "out" / f"{tag}_{args.split}_{stamp}"
    samples_fp = out_dir / "samples.jsonl"

    print(f"Model   : {args.adapter or args.base_url}")
    print(f"Split   : {args.split}  (prompts={public_fp}, hidden={private_fp})")
    print(f"Output  : {out_dir}")
    print(f"Sampling: n={args.n_samples}  temperature={args.temperature}  top_p={TOP_P}")

    prompts = read_jsonl(public_fp)
    if args.only_ids:
        keep = {ln.strip() for ln in args.only_ids.read_text().splitlines() if ln.strip()}
        before = len(prompts)
        prompts = [p for p in prompts if p["id"] in keep]
        print(f"Filtered by --only-ids: {before} → {len(prompts)}")
    if args.base_url:
        samples = generate_samples_http(args.base_url, prompts, args.limit, args.gen_workers,
                                        args.n_samples, args.temperature)
    else:
        from utils.model import load_model  # noqa: E402  (torch/unsloth: HF path only)
        model, tokenizer = load_model(args.adapter, MAX_SEQ_LENGTH, load_in_4bit=True)
        samples = generate_samples(model, tokenizer, prompts, args.limit,
                                   args.n_samples, args.temperature)
    write_jsonl(samples_fp, samples)
    print(f"Wrote {len(samples)} samples → {samples_fp}")

    print("\nGrading via grade_stream (chunked + 32G cgroup)…")
    rc = subprocess.run(
        [
            sys.executable, str(grade_stream),
            "--problems",   str(private_fp),
            "--samples",    str(samples_fp),
            "--out-dir",    str(out_dir),
            "--chunk-size", "20",
            "--k",          args.k,
            "--timeout",    str(args.timeout),
            "--workers",    str(args.workers),
        ],
    ).returncode
    if rc:
        print(f"(grade_stream exited {rc} — non-fatal, keep-going)")
    print(f"\nSummary: {out_dir / 'summary.json'}")


if __name__ == "__main__":
    main()
