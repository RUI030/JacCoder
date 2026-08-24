# Model weight left in GPU after closing the notebook
> Open the notebook and restart the kernal

 Layer name mismatch（"missing adapter keys" warning）

- 原因： 訓練時沒傳 text_only=True → unsloth 保留 Ornith 的 processor VLM wrapper → adapter 存的 key 帶 .language_model. 層（base_model.model.model.language_model.layers.N...）。而 eval / inference 端 utils/model.py 一直用 text_only=True，unsloth 把 wrapper 拆掉、language_model 直接當 root，PEFT 找 base_model.model.model.layers.N... 對不上 → 靜默 load 空 adapter → 每個 checkpoint loss 都一樣（都是 base model loss）。
- 試錯過的死路： loss.py 傳 text_only=False 想反向對齊 → 撞到 unsloth Issue #1436 未修的 VLM text-only bug（processor 讀輸入時當作圖片，PIL crash）。所以只能治本改訓練端。

2. Loss.py checkpoint 迴圈 OOM

- 原因： 每個 checkpoint load 一個新 model，del model, tokenizer; torch.cuda.empty_cache() 不夠 — Python 循環引用（trainer / peft wrapper / hooks 之間互指）撐住舊 model 的 refcount，GC 不跑就不釋放 → 第二次 load 時前一份 8GB 還佔著 VRAM。
- 修法： 加 import gc + gc.collect() + torch.cuda.ipc_collect()：
del model, tokenizer
gc.collect()             # 強制打斷循環引用
torch.cuda.empty_cache()
torch.cuda.ipc_collect() # 回收 IPC handle

（額外附贈的 CPT eval OOM） — 訓練時 eval_strategy="steps" OOM 是另一回事，是 accelerate/HF 把 bf16 logits 上 cast 到 fp32 造成的，還沒治本，現在用 DO_EVAL=False 迴避，改用 loss.py 這條 forward-only path 補 eval。