# find_missing_ranges

Returns a list of tuples representing the missing ranges within the given bounds.
>>> find_missing_ranges([3, 5], 1, 10)
[(1, 2), (4, 4), (6, 10)]
>>> find_missing_ranges([1, 2, 3, 7, 8, 9], 1, 10)
[(4, 6), (10, 10)]

Implement `find_missing_ranges(arr: list[int], lo: int, hi: int) -> list[tuple[int, int]]`.
