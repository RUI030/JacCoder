# Dataset
This folder contains dataset for finetuning LLM for Jac. Using Hugging Face format.

| Folder   | Purpose                  | Example          |
| -------- | ------------------------ | ---------------- |
| `raw`    | all unprocessed raw data |                  |
| `CPT`    | sequence of text         | `{"text":"..."}` |
| `SFT`    | Instruction respond pairs| Message format   |

| Format       | Explain                 | CPT | SFT |
| ------------ | ----------------------- | --- | --- |
| **.jac**     | Single `.jac` code file | ⭕  | ⭕  |
| **.md**      | markdown files          | ⭕  | ⭕  |
| **repo**     | fullstack jac with docs | ⭕  | ⭕  |
| **session**  | Claude code sessions    |     | ⭕  |
| **diff**     | git diff                |     | ⭕  |

# Format
## JSONL
### CPT - Continual Pre-trainning
Continual pretraining is a kind of unsupervised learning
* **Mandatory fields**
The minimum set of field required to run the training script.
```json
{"text":"YOUR_TRAINING_DATA"}
```
* **Optional fields**
Metadata, used for dataset statistics
```json
{
    "text": "YOUR_TRAINING_DATA",
    "meta": 
    {
        "source": ["blog", "code", "book", "other"],
        "format": ["jac", "md", "repo", "session", "diff"],
        "class":  ["function", "osp", "fullstack"]
    }
}
```

### SFT - Supervised Fine-tuning
The minimum set of field required to run the training script.
```json
{
    "messages":
    [
        {"role": "system", "context": "You are a jac lang master who help user build their jac app"},
        {"role": "user", "context": "INSTRUCTION_HERE"},
        {"role": "assistant", "context": "RESPONSE_HERE"},
    ]
}
```
* **Optional fields**
Metadata, used for dataset statistics, same as CPT.
```json
{
    "messages":[],
    "meta": []
}
```

# Format
More system and instruction templates are available at `script/dataset/prompt_template.json` It is better to have template for each dataset.
## Single Jac File
### CPT
The following code should be in the `"text"` column.
* **With Frontmatter**
```python
# Language: Jac
"""
Describe what does this function do.
"""
def function_name(var1 : type, var2: type) -> {
    # The complete function here
    a = 100;
}
```

### SFT
No system prompt here since the data are short.
* **Code completion**:
```json
"messages":
    [
        {"role": "user", "context": "Please implement the following Jac function based on it's docstring and signature:
        \```jac
        \"""
        Function: Fibonacci
        \"""
        def fib(n:int) -> list[int] 
        \```
        "},
        {"role": "assistant", "context": "
        \```jac
        def fib(n:int) -> list[int] {
            res: list[int] = [1,1];
            if (n<3) return res[:n];
            else {
                i = 2;
                while (i<n) {
                    res.append(res[i-1]+res[i-2]);
                    i++;
                }
            }
            return res;
        }
        \```
        "},
    ]
```

## Markdown
### CPT
Chunk the data by header or paragraph, the following content will be in `"text"` column
* **Entire file:**
```markdown
---
file: jacdocs/concepts/node_and_graph.md
title: Node
tags: [tag1, tag2]
---
# Node and Graph
## Node
A node in jac is....

```
* **Chunk**:
```markdown
> Document: `docs/graph_and_node.md` > Graph and Node (Header 1) > Node (Header 2) ...
## Node
A node in jac is....

```

### SFT
Part of the data will include system prompt. (see `script/dataset/prompt_template.json`)
QA set genrated by Opus.
* Conceptual QA
* Coding example
<!-- * Syntax Rules / Docs Lookup
* Docs to Example -->
```json
"messages":
    [
        {"role": "system", "context": "You are a jac lang master who help user build their jac app"},
        {"role": "user", "context": "QUESTION_GENERATED_BY_OPUS"},
        {"role": "assistant", "context": "ANSWER_GENERATED_BY_OPUS"},
    ]
```

## Repo
> Under construction. Go orange :'<

## Git Diff
> Under construction. Go orange :'<

## Session
> Under construction. Go orange :'<
