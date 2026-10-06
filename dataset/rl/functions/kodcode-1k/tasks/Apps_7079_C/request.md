# can_fill_knights

Given number of test cases and sizes of chessboards, determine if it's possible to place knights
such that none of them can attack each other.

Parameters:
T (int): Number of test cases.
test_cases (list of int): List of chessboard sizes for each test case.

Returns:
list of str: List of "YES" or "NO" strings for each test case.

>>> can_fill_knights(3, [1, 2, 3])
["YES", "YES", "NO"]
>>> can_fill_knights(1, [1])
["YES"]

Implement `can_fill_knights(T: int, test_cases: list[int]) -> list[str]`.
