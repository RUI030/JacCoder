# longest_contiguous_subarray

Find the length of the longest contiguous subarray such that all the elements
in the subarray are either strictly increasing or strictly decreasing.

>>> longest_contiguous_subarray(2, [(6, [1, 2, 3, 4, 5, 3]), (5, [5, 4, 3, 2, 1])])
[5, 5]
>>> longest_contiguous_subarray(1, [(1, [1])])
[1]

Implement `longest_contiguous_subarray(t: int, test_cases: list[tuple[int, list[int]]]) -> list[int]`.
