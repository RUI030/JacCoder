def max_sum_after_k_operations(T: int, test_cases: list[tuple[tuple[int, int], list[int]]]) -> list[int] {
    result = [];
    for i in range(T) {
        (N, K) = test_cases[i][0];
        A = test_cases[i][1];
        abs_A = [abs(x) for x in A];
        result.append(sum(abs_A));
    }
    return result;
}

