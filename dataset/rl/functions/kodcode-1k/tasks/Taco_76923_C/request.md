# can_rearrange_no_adjacent_same_parity

Determine if it's possible to rearrange the sequence such that no two adjacent elements have the same parity.

Args:
    t (int): The number of test cases.
    test_cases (List[Tuple[int, List[int]]]): A list of tuples, each containing the number of elements and the sequence of integers.

Returns:
    List[str]: A list of "YES" or "NO" for each test case.

>>> can_rearrange_no_adjacent_same_parity(3, [(3, [1, 2, 3]), (4, [2, 4, 6, 8]), (5, [1, 3, 5, 7, 9])])
["YES", "NO", "NO"]
>>> can_rearrange_no_adjacent_same_parity(2, [(5, [1, 2, 3, 4, 5]), (3, [2, 4, 6])])
["YES", "NO"]

Implement `can_rearrange_no_adjacent_same_parity(t: int, test_cases: list[tuple[int, list[int]]]) -> list[str]`.
