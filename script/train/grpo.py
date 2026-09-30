import argparse
import sys
from pathlib import Path

from unsloth import is_bfloat16_supported                 # must precede trl: Unsloth patches GRPOTrainer on import
from trl import GRPOConfig, GRPOTrainer

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))   # script/: `utils` is script/utils, train helpers are train.utils
from utils import jac_cli
from dataset.pipeline import load_prompts
from rl.rewards import make_reward_funcs
from rl.task import load_split, to_dataset
from train.utils import ensure_chat_template, finalize_out_dir, load_trainable, print_gpu_banner, save_adapter

REPO_ROOT = Path(__file__).resolve().parent.parent.parent
PROMPT    = REPO_ROOT / "script" / "dataset" / "template" / "prompt_template.json"
# Ornith's template opens a <think> block unless enable_thinking is false, and TRL
# 0.24 renders prompts without template kwargs. Eval (utils/model.py) renders with
# thinking off, so training rollouts default to the same.
THINK_OFF = "{%- if enable_thinking is not defined %}{%- set enable_thinking = false %}{%- endif %}"


# Defaults (also the config schema for train.py) ============================
def default_config() -> dict:
    return {
        # Model
        "base_model":     "ornith-ai/Ornith-1.5-9B",
        "adapter":        "",
        "resume_from":    "",
        "max_seq_length": 4096,
        "dtype":          None,
        "load_in_4bit":   True,
        "text_only":      True,
        "chat_template":  None,  # preserve the base tokenizer's native template
        "enable_thinking": False,
        # Output
        "run_name":       "",
        "out_dir":        "",
        "merge":          False,
        "save_method":    "merged_4bit",
        "push_hf":        False,
        "hf_org":         "jaseci",
        "hf_repo":        "",
        "hf_token":       "",
        "report_to":      ["tensorboard"],
        "log_freq":       1,
        # Hyperparameters
        "epochs":         1,
        "batch_size":     8,          # completions per device step, not prompts
        "grad_acc":       2,          # batch_size × grad_acc completions per update = (that / num_generations) groups
        "optimizer":      "adamw_8bit",
        "lr":             5e-6,       # Unsloth GRPO notebooks
        "scheduler":      "linear",
        "warmup_steps":   5,
        "max_steps":      -1,
        "weight_decay":   1e-3,
        "max_grad_norm":  1.0,
        "save_steps":     25,
        "save_total_limit": None,
        # GRPO (every key TRL would otherwise default, so a TRL upgrade can't change a run)
        "num_generations":        8,
        "temperature":            0.8,
        "top_p":                  1.0,
        "top_k":                  None,
        "min_p":                  None,
        "repetition_penalty":     1.0,
        "max_prompt_length":      1024,
        "max_completion_length":  768,
        "beta":                   0.0,     # with PEFT the reference is the adapter-off base, not the SFT policy
        "num_iterations":         1,
        "loss_type":              "dapo",
        "importance_sampling_level": "token",   # "sequence" = GSPO
        "epsilon":                0.2,
        "epsilon_high":           None,
        "scale_rewards":          "group",
        "mask_truncated_completions": True,
        "shuffle_dataset":        True,
        "log_completions":        False,
        # Reward / grading
        "reward":         "functions",    # functions | constant (plumbing smoke test)
        "grade_workers":  4,
        "grade_mem_gb":   4,
        "grade_timeout":  30,
        "purge_pg_steps": 10,
        # LoRA (only used when no adapter is given)
        "lora_rank":      64,
        "lora_alpha":     16,
        "lora_dropout":   0,
        "target_module": ["q_proj", "k_proj", "v_proj",
                          "o_proj", "gate_proj",
                          "up_proj", "down_proj"],
        "rslora":         True,
        "bias":           "none",
        "grad_checkpt":   "unsloth",
        # Misc
        "seed":           3407,
    }


def run_grpo(config: dict, train_ds, eval_ds=None):
    """Run one GRPO loop over an RL task dataset.

    `train_ds` rows carry `prompt` (messages) plus `task_id`, `task_dir` and
    `task_type`, which reach the reward functions as kwargs. `eval_ds` is unused
    (in-training generation eval doesn't fit 16GB); use eval/rl/run_eval.py.
    Writes rollouts/ next to the checkpoints and the adapter.
    """
    cfg = {**default_config(), **config}
    finalize_out_dir(cfg)
    Path(cfg["out_dir"], "runs").mkdir(parents=True, exist_ok=True)

    model, tokenizer = load_trainable(cfg)
    tokenizer = ensure_chat_template(tokenizer, cfg)
    native_template = tokenizer.chat_template
    if not cfg["enable_thinking"]:
        tokenizer.chat_template = THINK_OFF + native_template

    reward_funcs, reward_weights = make_reward_funcs(cfg)

    training_args = GRPOConfig(
        per_device_train_batch_size = cfg["batch_size"],
        gradient_accumulation_steps = cfg["grad_acc"],

        num_train_epochs = cfg["epochs"],
        max_steps        = cfg["max_steps"],
        warmup_steps     = cfg["warmup_steps"],

        learning_rate     = cfg["lr"],
        optim             = cfg["optimizer"],
        weight_decay      = cfg["weight_decay"],
        lr_scheduler_type = cfg["scheduler"],
        max_grad_norm     = cfg["max_grad_norm"],

        num_generations            = cfg["num_generations"],
        temperature                = cfg["temperature"],
        top_p                      = cfg["top_p"],
        top_k                      = cfg["top_k"],
        min_p                      = cfg["min_p"],
        repetition_penalty         = cfg["repetition_penalty"],
        max_prompt_length          = cfg["max_prompt_length"],
        max_completion_length      = cfg["max_completion_length"],
        beta                       = cfg["beta"],
        num_iterations             = cfg["num_iterations"],
        loss_type                  = cfg["loss_type"],
        importance_sampling_level  = cfg["importance_sampling_level"],
        epsilon                    = cfg["epsilon"],
        epsilon_high               = cfg["epsilon_high"],
        scale_rewards              = cfg["scale_rewards"],
        mask_truncated_completions = cfg["mask_truncated_completions"],
        shuffle_dataset            = cfg["shuffle_dataset"],
        reward_weights             = reward_weights,
        log_completions            = cfg["log_completions"],

        logging_steps    = cfg["log_freq"],
        save_steps       = cfg["save_steps"],
        save_total_limit = cfg["save_total_limit"],

        fp16 = not is_bfloat16_supported(),
        bf16 = is_bfloat16_supported(),

        seed       = cfg["seed"],
        output_dir = cfg["out_dir"],
        report_to   = cfg["report_to"],
        logging_dir = f"{cfg['out_dir']}/runs",
    )

    trainer = GRPOTrainer(
        model            = model,
        processing_class = tokenizer,
        reward_funcs     = reward_funcs,
        args             = training_args,
        train_dataset    = train_ds,
    )

    print_gpu_banner()
    try:
        trainer.train(resume_from_checkpoint=cfg["resume_from"] or None)
    finally:
        if cfg["reward"] != "constant":
            jac_cli.purge_pg()
    tokenizer.chat_template = native_template
    save_adapter(model, tokenizer, cfg, stage="grpo")


# CLI (single-set workflow — recipes go through train.py) ===================
def config_from_cli() -> tuple[dict, Path]:
    cli = argparse.ArgumentParser(add_help=False)
    cli.add_argument("--task", dest="task")
    cli.add_argument("--ds", "--set", dest="set_name")
    cli.add_argument("--adapter", "--adapter-path", dest="adapter")
    cli.add_argument("--lr", type=float)
    cli.add_argument("--steps", dest="max_steps", type=int)
    cli.add_argument("--resume", dest="resume",
                     help="checkpoint dir to resume from (mutex with --adapter)")
    args, _ = cli.parse_known_args()
    if args.resume and args.adapter:
        raise SystemExit("--resume and --adapter are mutually exclusive")

    cfg  = default_config()
    task = args.task     or "functions"
    ds   = args.set_name or "spike-sample-20"
    cfg["adapter"]     = args.adapter or ""
    cfg["resume_from"] = args.resume  or ""
    if args.lr        is not None: cfg["lr"]        = args.lr
    if args.max_steps is not None: cfg["max_steps"] = args.max_steps
    cfg["run_name"] = f"grpo-{task}-{ds}"
    return cfg, REPO_ROOT / "dataset" / "rl" / task / ds


if __name__ == "__main__":
    cfg, set_dir = config_from_cli()
    prompts = load_prompts(PROMPT, "system", "rl_functions")
    run_grpo(cfg, to_dataset(load_split(set_dir, "train"), prompts, cfg["seed"]))
