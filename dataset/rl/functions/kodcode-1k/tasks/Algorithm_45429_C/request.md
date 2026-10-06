# schedule_meetings

Schedules the maximum number of non-overlapping meetings from the list of meeting requests.

Parameters:
meetings (list of tuples): Each tuple contains two integers representing the start and end times of a meeting request.

Returns:
list of tuples: The maximum set of non-overlapping meetings that can be accommodated.

Examples:
>>> schedule_meetings([(1, 3), (2, 4), (3, 5), (0, 6), (5, 7), (8, 9)])
[(1, 3), (3, 5), (5, 7), (8, 9)]
>>> schedule_meetings([(0, 1), (3, 5), (4, 6), (6, 8), (5, 7)])
[(0, 1), (3, 5), (6, 8)]

Implement `schedule_meetings(meetings: list[tuple[int, int]]) -> list[tuple[int, int]]`.
