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
3. MoE adapter merge 進 4-bit 後等於 base model（Qwen3-Coder-30B-A3B）

- 症狀： SFT 後 batch.py 小 eval 通過率 0–20%，code_gen 的 prompt 沒寫「Jac」時模型直接回 React/JSX、Python。訓練 loss 正常（code_gen 降到 0.40）。
- 原因： utils/model.py:load_model 一律 merge_and_unload()。這個 MoE adapter 的 LoRA 掛在 fused expert 參數上（adapter_config 有 target_parameters），merge 進 4-bit base 之後生成結果跟 base model 一模一樣，adapter 效果整個消失，而且沒有任何 warning。
- 怎麼確認： 同一個 training prompt 跑三種模式——adapter 不 merge（輸出 ```jac cl { def:pub Counter() ...，跟訓練答案一致）、disable_adapter()（React）、merge 後（React，跟 base 完全相同）。
- 修法： load_model 遇到 target_parameters 就不 merge，直接帶 adapter 推論（commit c44edd6）。Ornith 的 adapter 照舊 merge（它反而需要 merge 才不會 mis-attach）。要匯出（GGUF / 部署）就 merge 成 16-bit（save_pretrained_merged(..., "merged_16bit")），不要 merge 進 4-bit，並用 training prompt 驗證。
- 附帶： 之前 CPT adapter 的 inference 測試（寫出 func factorial 之類不合法語法）也走同一條 merge 路徑，那次看到的其實是 base model。

4. Packed SFT 把下一段對話的 system prompt 也拿去訓練

- 症狀： packing: true 的 smoke，每個 packed sequence 的 trained span 數 ≈ 2×對話數−1，多出來的 span 從 <|im_start|> 後的 "system\n..." 開始。
- 原因： train_on_responses_only 在 packing 之後才跑，把整條 packed sequence 當成一段多輪對話：從 assistant marker unmask 到下一個 user marker，中間剛好夾著下一段對話的 system prompt。有 system prompt 的資料集（code_completion / js2jac / farm / scaffold2impl，約 60% 樣本）都會中。
- 死路： 改成預先 tokenize 並帶 assistant_masks 欄位 → Unsloth 對已 tokenize 的資料只保留 input_ids（外加 labels），換成不看 mask 的 DataCollatorForLanguageModeling，結果整條 sequence 都被訓練（loss 從 0.2 跳到 0.5–0.75）。
- 修法： sft.py 在 packing 前逐段對話 tokenize，labels 只留 assistant turn（內容 + <|im_end|>\n），用 labels 欄位帶過 packing，並跳過 train_on_responses_only（commit 4599fa7）。驗證：trained spans == assistant turns、沒有 system/user token、position_ids 每段重新從 0 開始。

5. sequential mixing 其實被 shuffle 掉

- 症狀： 沒有明顯症狀；只是 sequential 跟 concat 的結果比不出差別。
- 原因： mixer.py 的 sequential 有照順序 concat，但 HF Trainer 預設 RandomSampler，每個 epoch 把整份資料重新打散。
- 修法： mixer 對 sequential recipe 設 train_sampling="sequential"，cpt.py / sft.py 傳成 train_sampling_strategy（commit 31da523）。在這之前的 trueseq run（例如 0910-trueseq-r64）實際上等同 concat。
