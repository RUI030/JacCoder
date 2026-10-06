# max_activities

Determines the maximum number of non-overlapping activities that can be attended.

:param n: Number of activities
:param intervals: List of tuples, each with start and end time of an activity
:return: Maximum number of non-overlapping activities

>>> max_activities(3, [(1, 4), (2, 3), (3, 5)])
2
>>> max_activities(4, [(1, 2), (3, 4), (0, 6), (5, 7)])
3

Implement `max_activities(n: int, intervals: list[tuple[int, int]]) -> int`.
