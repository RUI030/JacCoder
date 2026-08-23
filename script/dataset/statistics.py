

"""Generate a machine-readable report for a JSONL dataset directory."""

import argparse, json, math
from collections import Counter
from pathlib import Path


PROPERTY_VALUES = {
    "format": ["jac", "markdown", "repo", "session", "diff"],
    "class": ["function", "graph", "osp", "fullstack"],
    "source": ["code", "docs", "article", "agent", "other"],
}
SPLITS = ("train", "valid")
LENGTH_BINS = [100, 200, 500, 1000, 2000, 5000, 10000]  # char upper-bounds; last bucket = ">last"


def sample_text(sample):
    """Return the trainable text from either a CPT or SFT sample."""
    if isinstance(sample.get("text"), str):
        return sample["text"]

    messages = sample.get("messages", [])
    if isinstance(messages, list):
        return "\n".join(
            message.get("content", message.get("context", ""))
            for message in messages
            if isinstance(message, dict)
        )
    return ""


def empty_property_counts():
    return {
        name: Counter({value: 0 for value in values})
        for name, values in PROPERTY_VALUES.items()
    }


def length_statistics(lengths):
    """Calculate dependency-free character-length statistics."""
    if not lengths:
        return {
            "unit": "characters",
            "avg": 0,
            "median": 0,
            "std": 0,
            "min": 0,
            "max": 0,
        }

    ordered = sorted(lengths)
    count = len(ordered)
    avg = sum(ordered) / count
    middle = count // 2
    median = (
        ordered[middle]
        if count % 2
        else (ordered[middle - 1] + ordered[middle]) / 2
    )
    variance = sum((length - avg) ** 2 for length in ordered) / count

    return {
        "unit": "characters",
        "avg": round(avg, 2),
        "median": median,
        "std": round(math.sqrt(variance), 2),
        "min": ordered[0],
        "max": ordered[-1],
    }


def length_histogram(lengths, bins=LENGTH_BINS):
    counts = [0] * (len(bins) + 1)
    for x in lengths:
        for i, edge in enumerate(bins):
            if x <= edge:
                counts[i] += 1
                break
        else:
            counts[-1] += 1
    labels = [f"<={bins[0]}"]
    labels += [f"{bins[i-1]+1}-{bins[i]}" for i in range(1, len(bins))]
    labels += [f">{bins[-1]}"]
    return dict(zip(labels, counts))


def read_split(ds_dir, split):
    files = sorted(Path(ds_dir).glob(f"{split}*.jsonl"))
    for file_path in files:
        with file_path.open("r", encoding="utf-8") as file:
            for line_number, line in enumerate(file, start=1):
                if not line.strip():
                    continue
                try:
                    yield json.loads(line)
                except json.JSONDecodeError as error:
                    raise ValueError(
                        f"Invalid JSON in {file_path}, line {line_number}: {error}"
                    ) from error


def summarize_split(ds_dir, split):
    lengths = []
    properties = empty_property_counts()
    combinations = Counter()

    for sample in read_split(ds_dir, split):
        lengths.append(len(sample_text(sample)))
        meta = sample.get("meta") or {}
        values = {
            name: str(meta.get(name, "unknown"))
            for name in PROPERTY_VALUES
        }

        for name, value in values.items():
            properties[name][value] += 1
        combinations[(values["format"], values["class"], values["source"])] += 1

    count = len(lengths)
    length_report = length_statistics(lengths)

    combination_report = [
        {
            "format": format_name,
            "class": class_name,
            "source": source_name,
            "count": combination_count,
        }
        for (format_name, class_name, source_name), combination_count
        in sorted(combinations.items())
    ]

    return {
        "count": count,
        "length": length_report,
        "histogram": length_histogram(lengths),
        "property": {
            name: dict(sorted(counts.items()))
            for name, counts in properties.items()
        },
        "combinations": combination_report,
    }


def generate_report(ds_dir):
    """Generate statistic.json inside ds_dir and return its path."""
    ds_dir = Path(ds_dir)
    if not ds_dir.is_dir():
        raise NotADirectoryError(f"Dataset directory not found: {ds_dir}")

    report = {
        split: summarize_split(ds_dir, split)
        for split in SPLITS
    }
    output_file = Path(f"{ds_dir}/statistic.json")
    with output_file.open("w", encoding="utf-8") as file:
        json.dump(report, file, indent=4, ensure_ascii=False)
        file.write("\n")

    return output_file


def main():
    parser = argparse.ArgumentParser(
        description="Generate statistics for train/valid JSONL dataset files."
    )
    parser.add_argument("DS_DIR", help="Directory containing train/valid JSONL files")
    args = parser.parse_args()

    output_file = generate_report(args.DS_DIR)
    print(f"Report saved to {output_file}")


if __name__ == "__main__":
    main()
