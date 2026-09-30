# JacCoder Reinforcement Learning 計畫

## 目標與範圍

目標是提高模型產生可編譯、能通過行為測試的 Jac 程式的機率。先做小型 spike，確認 prompt／completion 格式、grader、reward 和單步訓練能接通；暫不大量製作新資料。起點是已有部分成功樣本的 SFT adapter：如果同一題的所有 rollout 都失敗且 reward 相同，group-relative 方法沒有可用的學習訊號。

第一階段只訓練**單輪 function-level Jac code generation**。先建立 JacCoder 自己的統一 grading suite，再實作第一個 function evaluator。既有 [Nitin-test](../script/eval/Nitin-test/USER_MANUAL.md) 是 vendored benchmark：可用來對照輸出及測試計分，不能成為新 suite 的核心依賴，也不能改寫它的 private `test` split。`docs/idea/Factory4Eval.md` 的 repo-level Factory 分析可作後續參考；整個 Factory pipeline 的時間成本與多輪形式不適合作為這個 spike 的 rollout。

## 統一 grading suite 的邊界

先統一**評分結果和執行規則**，不用強迫所有任務共用同一套測試。grader 的標準輸入是一次 rollout 產生的 `submission_dir`：其中是實際要檢查的 `.jac` 專案檔案；task 另外記錄 `task_id`、`track`、不可變的起始檔案／需求、測試套件 ID 與版本。介面可以是 `grade(task, submission_dir) -> GradeResult`。各 track 的 evaluator 在此資料夾上執行相關 gates，最後回傳相同格式的結果。

**模型的輸出格式與 grader 的輸入格式分開**：自有單檔任務可以要求模型回傳恰好一個標記為 `jac` 的 fenced code block，用既有 `script/utils/jac_block.py` 的 `extract_jac_blocks()` 取出並檢查數量恰好為一；task metadata 決定檔名，adapter 寫入 `submission_dir`。模型不需產生 folder 或決定路徑。multifile 任務若指定單一目標檔，同樣由 task 指定相對路徑；若一次產生多個檔，需另定檔名／patch 格式，不能把多個無標籤 Jac fences 猜成不同檔案。tool-use agent 已經在自己的工作區改檔，收集最後的 repo snapshot 作 submission。`raw_output`／工具軌跡、`GradeResult` 和 logs 放在 submission 外面的 run record，以便重播訓練 rollout。不要把 hidden tests 或 grader 腳本放進模型可讀的 submission folder。

這是新增統一 suite 的內部邊界，不要求一次遷移既有 inference JSONL。現有 `script/eval/gate.py` 讀取 `prediction` 文字後會抽出第一個 Jac block；一般 SFT eval 的 `meta.fp` 帶有來源檔識別，但不一定是可直接寫入的 filesystem path，須由 task 定義安全的目標路徑。vendored Nitin function 題有 `id`、`entrypoint`，completion 題另有 `prefix`，**沒有目標檔名**；它的 prompt 明確要求原始 continuation／Jac source，不要 Markdown fence，grader 自行命名暫存 `candidate.jac`。因此保留 Nitin 原本的輸出契約與 extractor 行為作外部 benchmark；自有 suite 才要求 fenced Jac。舊格式可經 adapter 轉成 submission。為了控制大量 GRPO rollout 的儲存成本，執行工作區可在評分後清理；保留足夠的原始輸出、task／suite 版本與精簡 artifacts，讓失敗樣本可重現。

```text
GradeResult = {
  task_id, track, candidate_id, suite_version,
  status,                 # graded / candidate_error / infra_error
  gates: [                # 每關都記錄 passed / failed / not_run
    {name, outcome, duration_ms, diagnostic_code}
  ],
  tests_passed, tests_total,   # 沒有行為測試時可為 null；不能假設 0/0 = 0
  artifacts,                   # 隔離儲存的詳細 logs、patch、截圖路徑
}
```

`status=graded` 表示候選程式確實被評分，包含行為測試沒有通過的情況；`candidate_error` 是抽取失敗、編譯失敗或確認由候選程式造成的資源超限；`infra_error` 表示 grader、Jac runtime、資料庫或測試環境出了問題，應重試或排除，不可當作模型答錯。gate diagnostic 對訓練端與審計端可見，但 private 測試原文、expected output 和機密環境資料不能出現在模型可見的 prompt／tool response。`GradeResult` 保留原始 facts；reward 是獨立的版本化函式 `reward(track, GradeResult)`，方便重新計分而不用重跑所有測試。

共同 runner 管理每個 submission 的隔離工作目錄、固定 Jac／依賴版本、timeout、輸出大小限制、process cleanup 與 logs；各 track 的 adapter 決定如何 materialize，evaluator 決定需要跑哪些 gates。這層可重用 [`script/utils/jac_cli.py`](../script/utils/jac_cli.py) 的 CLI 包裝概念，但在作為 RL gate 前須驗證 `jac check` 的非零退出語意（必要時用 `jac check -e`）、以及 timeout 和 HTTP 啟動／清理行為。先寫幾個已知通過、已知失敗、工具故障的 golden cases，確保各 evaluator 的狀態語意一致。

## 第一階段：function-level 實驗

每個 prompt 對應一題；從同一個 policy 獨立抽樣 G 個 completion，套上題目既有的 prefix／suffix，再在獨立工作目錄中評分。模型只看公開的 prompt 與必要的 prefix／suffix。JacCoder 自有的訓練題與執行期測試應分開管理；可以給 reward grader 使用測試，但不能把測試原文或 expected output 給模型。另留 cluster-disjoint 的評估題與測試，直到最終評估才使用。若用 Nitin suite 做外部 benchmark，尊重其 public/private split，不能把 private `test` 作 RL reward 或回填訓練資料。

先採用一個明確的 reward，再依觀測修正：

```text
若抽取失敗、違反題目 structural contract、或 jac check 失敗：reward = 0
若通過 jac check：reward = 0.1 + 0.9 × (通過的有效測試數 / 有效測試總數)
所有測試通過：reward = 1.0
```

這讓「可編譯但全錯」仍有小訊號，同時讓 partial pass 比只用 AC/WA 的 0/1 reward 更有資訊。測試結果必須明確為 `passed=true` 才算通過；若沒有任何有效測試或 `status=infra_error`，該樣本應重試或排除。timeout／資源超限需由 runner 明確判定是模型產物還是環境故障。先固定每題的測試集合與 Jac 版本，避免同一 group 被評在不同條件下。這是初始權重，不代表已證明 0.1 最佳；觀察 compile-only reward hacking 後再調整。

實作時以獨立 Python RL runner 呼叫**自有 suite** 的 `grade` API。保留 vendored Nitin grader 作外部對照，勿把它的 CLI 每個 completion 啟動一次或複製其內部資料格式作為新 API。現有 `grade_stream.py` 會清理共享的 embedded Postgres cache，不能直接拿來平行跑 RL groups。每個 rollout 需有獨立的暫存目錄、資料庫／資源限制、timeout 和完整的 task ID、candidate ID、verdict 記錄。

### 先量測，再訓練

1. 先用目前候選 SFT adapter，在約 32 題自有訓練／開發題上各抽 8 個樣本（約 256 次評分）；保存原始 completion 與 status。這是規模估計，依單次評分耗時縮放。
2. 報告 AC／pass@1、compile rate、test-pass fraction、`frac_reward_zero_std`（同題所有 reward 相同的 group 比例）、每個 status 的比例，以及生成與評分的時間分布。
3. 若大部分 group 全 0 或全 1，先調整題目難度、起始 adapter、reward 或抽樣設定；增加訓練 steps 不會自行創造同題的相對訊號。若測試噪音或 infra failure 高，先修 verifier。
4. 用少量題目做 GRPO 訓練 smoke run：確認 reward 函式接收正確的 completion／題目 ID、同題 G 個樣本會成組、loss／梯度非零、checkpoint 可載入，並觀察 completion truncation 與耗時。以幾個 golden cases 核對新 suite 的判分與 Nitin 外部對照一致。通過後才擴大 run。

## GRPO 與 GSPO 的 A/B

兩者都可以用**整個 completion 的同一個 scalar reward**，並在同一題的 G 個 rollout 之間計算相對 advantage。差別在 policy update：GRPO 用 token-level importance sampling ratio；GSPO 將有效 token 的 log-ratio 聚合成每段 completion 一個 sequence-level ratio。GSPO 對長答案、MoE 訓練可能更穩定，但這在 Jac 任務上仍是待測假說，不能從模型種類直接推定效果。

本 repo 的 [`requirement.txt`](../requirement.txt) pin `trl==0.24.0`；該版本的 `GRPOConfig` 已有 `importance_sampling_level`。兩組保持相同的模型起點、prompt、reward、資料 split、sampling、`loss_type`、optimizer 和 token budget，只變動這一個參數：

```python
from trl import GRPOConfig, GRPOTrainer

args = GRPOConfig(
    # 其餘參數於兩組固定；G、batch 與硬體容量先在 smoke run 驗證
    num_generations=8,
    temperature=0.8,
    importance_sampling_level="token",     # GRPO baseline
    # importance_sampling_level="sequence", # GSPO arm
)
```

`loss_type` 決定另一項 loss normalization（例如 `dapo`），和 `importance_sampling_level` 是兩個獨立的選擇。先記錄並固定實際生效的 config/default；不要只因 trainer 叫 `GRPOTrainer` 或 notebook 標題寫 GSPO，就判定本次 run 用了哪個 ratio。紀錄 `trl`、`unsloth`、`unsloth_zoo`、Jac、model／tokenizer／adapter 版本，以及最終的 `args.importance_sampling_level`。Unsloth 官方 [advanced RL docs](https://unsloth.ai/docs/get-started/reinforcement-learning-rl-guide/advanced-rl-documentation) 與 [TRL 0.24 GRPO docs](https://huggingface.co/docs/trl/v0.24.0/grpo_trainer) 是這個設定的依據。

先把 `temperature=0.8`、`num_generations=8` 當待驗證起點，不是 Ornith 的最佳值。`Attempt: 16` 應拆成明確的量：若指評估的 pass@16，則每題抽 16 個樣本，只用於評估；若指 rollout group size，需另測成本與 reward diversity。不要把 inference `top_p`／`top_k` 的建議值直接當 RL trainer 的最佳設定。保留相同 seed 與資料順序做 A/B，並在獨立 held-out `test` 比較 pass@1、pass@k、compile rate、partial-pass 分布、reward、zero-std groups、completion 長度、clip ratio 和訓練耗時；單次小型 run 的差異只當方向訊號。

## 後續任務，按所需能力排序

| 任務 | Rollout 單位與 verifier | 開始條件 |
|---|---|---|
| Multifile backend | 共用 `GradeResult`；給固定 repo snapshot 與指定檔案，模型一次輸出 patch，套用後跑 `jac check`／測試與跨檔引用檢查 | 單檔 reward 有訊號且 grader 穩定 |
| Tool use | 共用工作區 runner 與 `GradeResult`；記錄模型 token、工具輸入輸出及哪些 token 參與 loss，最後用 gates 評分 | 支援同一訓練 policy 的多輪 tool rollout，並量測 token／時間成本 |
| Fullstack | 共用 `GradeResult`；由標準 web-app scaffold 與需求開始，先用可重現的 build、HTTP、browser smoke assertions 評分，再研究視覺評估 | backend verifier 與隔離成熟後 |

Tool-use 階段若使用 Claude Code／Codex／OpenCode 作 harness，還需要確認 rollout 真由正在訓練的 policy 產生，且訓練端可重建其 action token、logprobs、mask 與 policy 版本；單純從外部 CLI 收到工具軌跡和最終分數，不足以做 on-policy GRPO。**目前 pinned 的 TRL 0.24.0 沒有文件化的 agent environment API**；較新的 TRL 已有 `tools`／`environment_factory`，但升級前要對 Unsloth 與 Ornith 做相容性 spike。multi-turn 的工具回覆不應被當成 policy 產生的 token。參見 [TRL agent training docs](https://huggingface.co/docs/trl/grpo_trainer#agent-training)。

Fullstack 的 `jac create --use jac-shadcn`／web-app scaffold 形式須以實際 pinned Jac CLI 確認。視覺品質可以在後期用 browser screenshot 加人工或模型評估；第一版先定義可重現的行為驗收，避免主觀評分主導 reward。

## 完成 spike 的證據

留下最小可重現紀錄：訓練配置與版本、task ID 清單、suite／reward 版本、每個 sample 的原始輸出與 `GradeResult`、group reward 分布、耗時、checkpoint、held-out 評估。成功標準是能在相同 grader 上重跑評分、至少看到一部分 group 有非零 reward 差異、訓練更新確實發生，並能用保留測試集比較 GRPO 與 GSPO；若未達成，應先回到資料或 verifier 的問題，不宣稱演算法優劣。
