def min_ingredient_sum(T: int, test_cases: list[tuple[int, int, int, int]]) -> list[int] {
    results = [];
    for `case in test_cases {
        (M, P, Q, R) = `case;
        min_sum = P * Q;
        results.append(min_sum);
    }
    return results;
}

