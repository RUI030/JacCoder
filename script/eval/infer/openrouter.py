"""OpenRouter inference driver — writes predictions.jsonl compatible with gate.py.

Same output schema as script/eval/sft/infer.py, so gate.py, confmat.py, and
the failure-taxonomy scripts run unchanged on the result.

Usage:
    export OPENROUTER_API_KEY=sk-or-...
    python script/eval/openrouter/infer.py \
        --model anthropic/claude-3.5-sonnet \
        --task osp --ds Nitin-1k-osp \
        --limit 0 --workers 8

Output goes to:
    output/eval/<task>/<ds>/<model_slug>_<stamp>/predictions.jsonl
"""

import argparse, json, os, sys, time
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime
from pathlib import Path

import requests

PROJECT_ROOT = Path(__file__).resolve().parents[3]

# CLI ======================================================
ap = argparse.ArgumentParser()
ap.add_argument("--model",   required=True, help="OpenRouter model id, e.g. anthropic/claude-3.5-sonnet")
ap.add_argument("--task",    required=True, help="task name (matches dataset/sft/<task>/)")
ap.add_argument("--ds",      required=True, help="dataset name (matches dataset/sft/<task>/<ds>/)")
ap.add_argument("--split",   default="valid")
ap.add_argument("--limit",   type=int, default=0, help="0 = all records")
ap.add_argument("--workers", type=int, default=8, help="concurrent requests")
ap.add_argument("--max-tokens",  type=int,   default=2048)
ap.add_argument("--temperature", type=float, default=0.0)
ap.add_argument("--top-p",       type=float, default=0.9)
ap.add_argument("--timeout",     type=int,   default=180, help="per-request seconds")
ap.add_argument("--retries",     type=int,   default=4)
ap.add_argument("--out-tag",     default=None, help="override auto tag in output dir name")
args = ap.parse_args()

API_KEY = os.environ.get("OPENROUTER_API_KEY")
if not API_KEY:
    sys.exit("OPENROUTER_API_KEY not set")

IN_FILE = PROJECT_ROOT / "dataset" / "sft" / args.task / args.ds / f"{args.split}.jsonl"
if not IN_FILE.is_file():
    sys.exit(f"input not found: {IN_FILE}")

TAG   = args.out_tag or args.model.replace("/", "_")
STAMP = datetime.now().strftime("%m-%d_%H-%M")
OUT_DIR  = PROJECT_ROOT / "output" / "eval" / args.task / args.ds / f"{TAG}_{STAMP}"
OUT_FILE = OUT_DIR / "predictions.jsonl"
OUT_DIR.mkdir(parents=True, exist_ok=True)

URL = "https://openrouter.ai/api/v1/chat/completions"
HEADERS = {
    "Authorization": f"Bearer {API_KEY}",
    "Content-Type": "application/json",
}


def call_openrouter(messages):
    """One chat call with retry on 429 / 5xx / network errors."""
    body = {
        "model": args.model,
        "messages": messages,
        "max_tokens": args.max_tokens,
        "temperature": args.temperature,
        "top_p": args.top_p,
    }
    delay = 2.0
    last_err = None
    for attempt in range(args.retries + 1):
        try:
            r = requests.post(URL, headers=HEADERS, json=body, timeout=args.timeout)
            if r.status_code == 200:
                data = r.json()
                if "choices" not in data or not data["choices"]:
                    raise RuntimeError(f"no choices: {data}")
                return data["choices"][0]["message"]["content"] or ""
            if r.status_code in (429, 500, 502, 503, 504):
                last_err = f"HTTP {r.status_code}: {r.text[:200]}"
            else:
                return f"__ERROR__ HTTP {r.status_code}: {r.text[:500]}"
        except Exception as e:
            last_err = f"{type(e).__name__}: {e}"
        time.sleep(delay)
        delay = min(delay * 2, 30.0)
    return f"__ERROR__ {last_err}"


def process(idx_line):
    idx, line = idx_line
    rec = json.loads(line)
    messages = [m for m in rec["messages"] if m["role"] != "assistant"]
    reply = call_openrouter(messages)
    return {
        "id": idx,
        "prediction": reply,
        "reference": next(
            (m["content"] for m in rec["messages"] if m["role"] == "assistant"),
            "",
        ),
        "meta": rec.get("meta", {}),
    }


def main():
    with IN_FILE.open() as f:
        lines = list(enumerate(f))
    if args.limit:
        lines = lines[: args.limit]

    print(f"Model   : {args.model}")
    print(f"Input   : {IN_FILE}")
    print(f"Records : {len(lines)}")
    print(f"Workers : {args.workers}")
    print(f"Output  : {OUT_FILE}\n")

    # preserve input order in the output file
    results = [None] * len(lines)
    done = 0
    t0 = time.time()
    with ThreadPoolExecutor(max_workers=args.workers) as pool:
        futs = {pool.submit(process, il): il[0] for il in lines}
        for fut in as_completed(futs):
            idx = futs[fut]
            results[idx] = fut.result()
            done += 1
            if done % 20 == 0 or done == len(lines):
                dt = time.time() - t0
                rate = done / dt if dt else 0
                eta = (len(lines) - done) / rate if rate else 0
                print(f"  {done}/{len(lines)}  {rate:5.2f} req/s  eta {eta/60:5.1f} min")

    with OUT_FILE.open("w") as f:
        for r in results:
            json.dump(r, f, ensure_ascii=False)
            f.write("\n")

    err_ct = sum(1 for r in results if r["prediction"].startswith("__ERROR__"))
    print(f"\nWrote {len(results)} predictions ({err_ct} errored) to {OUT_FILE}")
    print(f"\nNext:  python script/eval/sft/gate.py --pred {OUT_FILE}")


if __name__ == "__main__":
    main()
