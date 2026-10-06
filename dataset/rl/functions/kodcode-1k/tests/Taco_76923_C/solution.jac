def can_rearrange_no_adjacent_same_parity(t: int, test_cases: list[tuple[int, list[int]]]) -> list[str] {
    results = [];
    for `case in test_cases {
        (n, sequence) = `case;
        even_count = sum(
            1
            for x in sequence
            if ((x % 2) == 0)
        );
        odd_count = n - even_count;
        if (abs((even_count - odd_count)) <= 1) {
            results.append("YES");
        } else {
            results.append("NO");
        }
    }
    return results;
}

