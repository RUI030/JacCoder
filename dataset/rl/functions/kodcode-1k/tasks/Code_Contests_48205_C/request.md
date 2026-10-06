# max_people_working_simultaneously

Given a list of intervals representing the working hours of multiple people in a team,
find the maximum number of people working simultaneously at any given point in time.

>>> max_people_working_simultaneously(5, [(1, 4), (2, 6), (4, 7), (5, 9), (7, 10)])
3
>>> max_people_working_simultaneously(3, [(0, 2), (1, 3), (2, 5)])
2

Implement `max_people_working_simultaneously(n: int, intervals: list[tuple[int, int]]) -> int`.
