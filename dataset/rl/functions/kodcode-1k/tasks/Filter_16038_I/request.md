# merge_intervals

I have a list of tuples that represents intervals, such as [(1, 2), (3, 5), (6, 7), ...]. 
The task is to merge all overlapping intervals into one interval. 

For example, given [(1, 2), (2, 4), (5, 6)], the output should be [(1, 4), (5, 6)]. 

Can you provide a solution in Python?

Example:
- `merge_intervals([(1, 2), (3, 5), (6, 7)]) == [(1, 2), (3, 5), (6, 7)]`

Implement `merge_intervals(intervals: list[tuple[int, int]]) -> list[tuple[int, int]]`.
