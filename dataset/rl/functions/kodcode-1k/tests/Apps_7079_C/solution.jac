"""
    Given number of test cases and sizes of chessboards, determine if it's possible to place knights
    such that none of them can attack each other.

    Parameters:
    T (int): Number of test cases.
    test_cases (list of int): List of chessboard sizes for each test case.

    Returns:
    list of str: List of "YES" or "NO" strings for each test case.
    """
def can_fill_knights(T: int, test_cases: list[int]) -> list[str] {
    results = [];
    for N in test_cases {
        if ((N > 1) and ((N % 2) == 1)) {
            results.append("NO");
        } else {
            results.append("YES");
        }
    }
    return results;
}

