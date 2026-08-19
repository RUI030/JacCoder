# Dataset
This folder contains dataset for finetuning LLM for Jac. Using Hugging Face format.

| Folder   | Purpose |
| -------- | ------- |
| `raw`    | all unprocessed raw data |
| `script` | processing raw data, make it correct format for training, provide tools to see the distribution of data|
| `CPT`    | sequence of text |
| `SFT`    | Instruction respond pairs|

# Format
## JSONL
### CPT - Continual Pre-trainning
Continual pretraining is a kind of unsupervised learning
* **Mandatory fields**
The minimum set of field required to run the training script.
```
{"text":"YOUR_TRAINING_DATA"}
```
* **Optional fields**
Metadata, used for dataset statistics
{
    "meta": 
    {
        "source": ["blog", "code", "book", "other"],
        "class": ["function", "osp", "fullstack"]
    }
}

### SFT - Supervised Fine-tuning


# Script
## `build_cpt_dataset.py`
### `code_cpt`
* Usage: 
```python
code2cpt("path/to/input/folder")
```
```python
code2cpt("path/to/input/folder", out_path = "../CPT/<InputFolderName>.jsonl", split)
```
* Input: folder path 
* Output: `jsonl` file
* Function: convert each file to single row of CPT training data
* Optional: 

| Field | Default | Format | Effect |
| ------- | ------- | ------ | ------ |
| `out_path` | `../CPT/<InputFolderName>.jsonl` | `string` | Output file path |
| `mark_file_name` | `False` | `bool` | add file name in header (using comment) |
| `split` | `[ 0.8, 0.2]` |  list of float | portion that accumulative sum is >1 will be discard, if sum <1, add an additional split for the remaining part |
| `split_name` | [`train`, `valid`] | list of string | if shorter then `split` then 3 digit of num will be auto filled |
| `shuffle` | `False` | `bool` | shuffle the order of data |
| `extension_filter` | `["jac"]` | list of string | only include the files with extension listed here in the dataset |

### `repo_cpt`
> Under construction
<!-- need chunking or assembly technique -->

### `html_cpt`
> Under construction
<!-- need chunking -->

### `md_cpt`
> Under construction
<!-- need chunking -->

## `chunking.py`
<!-- need chunking -->
* Recursively chunking, if too long, split by title and add a comment of header, eg 
```
<!-- <FILENAME>/<HEADING 1>/<HEADING 2>/<HEADING 3>/<CHUNK N> -->
```
<!-- not sure if we can do 1 function fit all and just set the chunk-regex -->

## `classifier.py`
### `naive`
Use keyword (or regex) to check the content.
| class | keyword |
| ----- | ------- |
| `osp` | `walker`, `spawn` |
| `graph` | `node`, `++>`, `-->` |
| `fullstack` | `JSX` |
| `function` | None of the above |

### `compiler`
Is there any compiler stuff that we can utilize to classify the data?
> Under construction
### `jsonl2parquet`
> Under construction
* Input: file path
* Output: 
* Purpose: once the dataset is fixed, parquet format is more memory efficient for saving data

## `statistic.py`
> Under construction
