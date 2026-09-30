# Merge overlapping intervals

Implement `merge_intervals(intervals: list[list[int]]) -> list[list[int]]`. Each
interval is `[start, end]` with `start <= end`. Merge every group of intervals that
overlap or touch (`[1, 3]` and `[3, 5]` touch) and return the result sorted by
start. The input may be unsorted.

Example:
- `merge_intervals([[1, 3], [2, 6], [8, 10]]) == [[1, 6], [8, 10]]`
