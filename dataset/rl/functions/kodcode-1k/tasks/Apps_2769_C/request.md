# merge_intervals

Create a function that takes a list of intervals and merges all overlapping intervals,
returning the resulting list of merged intervals.

Each interval is represented as a two-element list [start, end], where start is less than or equal to end.

>>> merge_intervals([[1, 3], [2, 6], [8, 10], [15, 18]])
[[1, 6], [8, 10], [15, 18]]
>>> merge_intervals([[1, 4], [4, 5]])
[[1, 5]]

Implement `merge_intervals(intervals: list[list[int]]) -> list[list[int]]`.
