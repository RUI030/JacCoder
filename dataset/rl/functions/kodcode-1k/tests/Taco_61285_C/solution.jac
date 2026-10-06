def smallest_missing_positive_integer(t: int, test_cases: list[tuple[int, list[int]]]) -> list[int] {
    result = [];
    for i in range(t) {
        (n, lst) = test_cases[i];
        nums = `set(lst);
        smallest_missing = 1;
        while (smallest_missing in nums) {
            smallest_missing += 1;
        }
        result.append(smallest_missing);
    }
    return result;
}

