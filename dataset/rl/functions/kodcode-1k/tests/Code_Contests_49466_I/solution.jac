"""
    Given multiple test cases, returns the smallest possible value of the remaining element after performing
    the defined operation on each array.
    """
def smallest_possible_element(t: int, test_cases: list[tuple[int, list[int]]]) -> list[int] {
    results = [];
    for test_case in test_cases {
        (n, arr) = test_case;
        results.append(sum(arr));
    }
    return results;
}

