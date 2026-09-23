#!/usr/bin/env bash
# Serve a GGUF on its own port, then run the Nitin harness as the non-root jacgrader user.
#   bash script/eval/Nitin-test/run_gguf.sh <gguf> <tag> <dev|test> [limit] [port]
# Needs a non-root `jacgrader` user (useradd -m jacgrader) and jac at /workspace/bin/jac.
set -uo pipefail
GGUF="$1"; TAG="$2"; SPLIT="$3"; LIMIT="${4:-0}"; PORT="${5:-8081}"; NP=16
ROOT=/workspace/JacCoder
cd "$ROOT"

/workspace/llama.cpp/build/bin/llama-server -m "$GGUF" -ngl 99 -np $NP -c $((NP * 8192)) \
    --jinja -fa on --port "$PORT" --host 127.0.0.1 > "logs/llama_server_${TAG}.log" 2>&1 &
SERVER=$!
trap 'kill $SERVER 2>/dev/null' EXIT
until curl -sf "http://127.0.0.1:${PORT}/health" >/dev/null; do
    kill -0 $SERVER 2>/dev/null || { echo "llama-server died"; tail -20 "logs/llama_server_${TAG}.log"; exit 1; }
    sleep 3
done
echo "llama-server ready on :$PORT"

# jacgrader: non-root (embedded postgres refuses root), clean env (no HF_TOKEN),
# 4 xdist workers per `jac test` (auto = 128 on this box, ~30GB per test).
su - jacgrader -c "cd $ROOT && export PATH=/workspace/bin:\$PATH PYTEST_XDIST_AUTO_NUM_WORKERS=4 && \
    /usr/local/bin/python script/eval/Nitin-test/run_eval.py --base-url http://127.0.0.1:${PORT}/v1 \
    --tag $TAG --split $SPLIT --limit $LIMIT --gen-workers $NP --timeout 120"
