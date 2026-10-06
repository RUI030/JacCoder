# find_missing_ranges

Identifies the missing ranges in a numerical sequence given a lower and upper bound.

>>> find_missing_ranges([3, 5], 1, 10)
[(1, 2), (4, 4), (6, 10)]

>>> find_missing_ranges([1, 2, 4, 5, 6, 10], 1, 10)
[(3, 3), (7, 9)]

Implement `find_missing_ranges(arr: list[int], lo: int, hi: int) -> list[tuple[int, int]]`.
