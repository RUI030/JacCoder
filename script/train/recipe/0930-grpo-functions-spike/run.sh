# GRPO functions spike: grader self-test → train → dev eval (n=8) of the GRPO adapter and its SFT base. Log to logs/:
#   setsid nohup bash script/train/recipe/0930-grpo-functions-spike/run.sh \
#     > logs/0930-grpo-functions-spike.log 2>&1 < /dev/null &
# An interrupted run resumes with `train.py --resume output/adapter/0930-grpo-functions-spike/grpo/checkpoint-N`.
set -euo pipefail
cd "$(dirname "$0")/../../../.."
PY=/home/imrui/miniforge3/envs/tornith/bin/python
R=script/train/recipe/0930-grpo-functions-spike
OUT=output/adapter/0930-grpo-functions-spike
stamp() { echo "===== $(date '+%m-%d %H:%M:%S') $*"; }
stamp "grader self-test"; $PY script/rl/graders/test_functions.py --workers 8
stamp "grpo";             $PY script/train/train.py --recipe $R/grpo.yaml
stamp "eval grpo dev";    $PY script/eval/rl/run_eval.py --adapter $OUT/grpo/adapter --split dev --n-samples 8 --temperature 0.8 --max-new-tokens 512
stamp "eval sft dev";     $PY script/eval/rl/run_eval.py --adapter output/adapter/0926-v13-A/sft/adapter --split dev --n-samples 8 --temperature 0.8 --max-new-tokens 512
stamp "ALL_DONE"
