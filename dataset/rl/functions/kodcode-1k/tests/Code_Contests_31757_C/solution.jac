def min_insertions_to_balance(t: int, test_cases: list[str]) -> list[int] {
    results = [];
    for s in test_cases {
        import from collections { Counter }
        count = Counter(s);
        max_count = max(count.values());
        total_chars = len(count);
        min_insertions = (max_count * total_chars) - sum(count.values());
        results.append(min_insertions);
    }
    return results;
}

