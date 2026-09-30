# Reinforcement Learning
> **Purpose**: 透過試錯來增強模型答對問題的機率（前提是他已經有學會一部分能力跟有機率寫對不然 0x any number is still 0）

# Spike
不是批量做 dataset or find source online 我們先確定格式跟提供幾個範例而已

# Design of the Experiment
## Backend
定義：給定一個問題與範例輸出輸入，要能夠過 hidden testcase
評分方式：0: failed to compile, 1: pass a testcase
A(Z分數)是針對同一題計算的所以最終 reward should be % testcase passed (缺點： 無法分辨testcase難易但是可以針對單一通過給分不然其很多partial pass 訊號會被浪費掉) 

## Multifile
還是後端但是會給特定檔案模型必須引用正確的檔案跟函式才能執行

## Tooluse
把模型插入 claude/codex/opencode 看模型能否正確操作檔案達到要求

## Fullstack
`jac create -- shacdn` init 一個專案給定一個用戶需求需要造出對應的 app
Checker - Jev model with playwrite??

# Method
## GRPO

## GSPO
Similar to GRPO but calculate the reward based on sequence-level instead of token level.
MoE benefit from this and training would be more stable.
How to do GSPO with Unsloth: 
```
training_args = GRPOConfig(
    # original setting...
    importance_sampling_level="sequence",
)
```

# Suggested parameters
Temperature: 0.8
Group size:8
Attempt: 16?

also Ornith official suggested that:
Ornith-1.5-35B-A3B is a reasoning model: by default the assistant turn opens with a <think> … </think> block before the final answer. The serving recipes below enable a reasoning parser so the chain-of-thought is returned in a separate reasoning_content field, and a tool-call parser so the model's <tool_call> blocks are surfaced as OpenAI-style tool_calls.

Serving Ornith-1.5-35B-A3B requires recent runtimes:

Transformers ≥ 5.8.1
vLLM ≥ 0.19.1
SGLang ≥ 0.5.9
Recommended sampling parameters:

For general tasks: temperature=0.6, top_p=0.95, top_k=20