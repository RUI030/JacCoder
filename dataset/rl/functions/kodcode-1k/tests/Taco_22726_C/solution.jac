def final_number_after_transformations(t: int, test_cases: list[tuple[int, list[int]]]) -> list[int] {
    results = [];
    for i in range(t) {
        (n, seq) = test_cases[i];
        while (len(seq) > 1) {
            new_seq = [max(seq[j], seq[(j + 1)]) for j in range((len(seq) - 1))];
            seq = new_seq;
        }
        results.append(seq[0]);
    }
    return results;
}

