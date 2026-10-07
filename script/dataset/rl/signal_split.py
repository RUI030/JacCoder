"""Write splits/<name>.txt: the N tasks of an RL set with the most GRPO signal, spread evenly over a meta field.

Signal = std of the per-sample rewards in a pre-screen run (`script/eval/rl/run_eval.py`); GRPO's advantage is
reward − group mean, so a task whose 8 rewards spread more gives a larger gradient. Each group (e.g. KodCode
subset) gets N / groups slots; slots a small group cannot fill go to the best remaining tasks overall.

    python script/dataset/rl/signal_split.py --set kodcode-1k --run output/eval/rl/functions/kodcode-1k/v13A-prescreen_train_10-05_17-40 \\
        --from-split train_active --n 180 --name train_180
"""

import argparse, json, statistics, sys
from collections import defaultdict
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from dataset.pipeline import load_prompts
from rl.task import load_split, to_dataset

# Setting =================================================
TASK              = "functions"
DS_ROOT           = f"{Path(__file__).resolve().parent}/../../../dataset"
PROMPT            = f"{Path(__file__).resolve().parent}/../template/prompt_template.json"
BY                = "subset"
MAX_PROMPT_TOKENS = 0             # 0 = no cap; a cap drops long-statement tasks (Code_Contests, Taco, Package) unevenly
TOKENIZER         = "output/model/JacLLM-SFT-Ornith-9B-v1.3A-bf16"
SEED              = 3407

# Functions ===============================================
def reward_std(run_dir: Path) -> dict[str, float]:
    rewards = defaultdict(list)
    for line in (run_dir / "results.jsonl").open():
        r = json.loads(line)
        rewards[r["id"]].append(r["reward"] or 0.0)        # infra_error (None) counts as 0, like a failed sample
    return {t: statistics.pstdev(v) for t, v in rewards.items()}


def prompt_tokens(set_dir: Path, split: str, tokenizer: str) -> dict[str, int]:
    from transformers import AutoTokenizer
    tok = AutoTokenizer.from_pretrained(tokenizer)
    rows = to_dataset(load_split(set_dir, split), load_prompts(PROMPT, "system", "rl_functions"), SEED)
    out = {}
    for r in rows:
        ids = tok.apply_chat_template(r["prompt"], tokenize=True, add_generation_prompt=True, enable_thinking=False)
        out[r["task_id"]] = len(ids["input_ids"] if hasattr(ids, "keys") else ids)
    return out


def select(candidates: list[str], std: dict[str, float], group: dict[str, str], n: int) -> list[str]:
    """Top-std tasks per group (n / groups each), leftover slots filled by the best remaining tasks overall."""
    ranked = sorted(candidates, key=lambda t: (-std[t], t))
    groups = sorted({group[t] for t in candidates})
    quota = n // len(groups)
    picked = [t for g in groups for t in [t for t in ranked if group[t] == g][:quota]]
    rest = [t for t in ranked if t not in set(picked)]
    return picked + rest[:n - len(picked)]


# Run =====================================================
if __name__ == "__main__":
    cli = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    cli.add_argument("--set", required=True, help="RL set name under dataset/rl/<task>/")
    cli.add_argument("--run", required=True, help="pre-screen run dir with results.jsonl")
    cli.add_argument("--from-split", default="train_active")
    cli.add_argument("--n", type=int, required=True)
    cli.add_argument("--name", required=True, help="output split name (splits/<name>.txt)")
    cli.add_argument("--by", default=BY, help="meta.json per-task field to balance over")
    cli.add_argument("--max-prompt-tokens", type=int, default=MAX_PROMPT_TOKENS, help="0 = no cap")
    cli.add_argument("--tokenizer", default=TOKENIZER)
    args = cli.parse_args()

    set_dir = Path(DS_ROOT) / "rl" / TASK / args.set
    meta = json.loads((set_dir / "meta.json").read_text())["tasks"]
    std = reward_std(Path(args.run))
    cap = args.max_prompt_tokens
    lengths = prompt_tokens(set_dir, args.from_split, args.tokenizer) if cap else \
        {t["id"]: 0 for t in load_split(set_dir, args.from_split)}
    pool = [t for t in lengths if (not cap or lengths[t] <= cap) and t in std]
    group = {t: meta[t][args.by] for t in pool}
    picked = select(pool, std, group, args.n)

    (set_dir / "splits" / f"{args.name}.txt").write_text("\n".join(sorted(picked)) + "\n")
    print(f"{args.from_split}: {len(lengths)} tasks, {len(pool)} with a pre-screen result"
          f"{f' and prompt <= {cap} tokens' if cap else ''} -> {len(picked)} in splits/{args.name}.txt")
    by_group = defaultdict(list)
    for t in picked:
        by_group[group[t]].append(std[t])
    for g in sorted(by_group):
        v = by_group[g]
        print(f"  {g:<16} {len(v):>3} of {sum(group[t] == g for t in pool):>3}   reward std {min(v):.2f}-{max(v):.2f}")
