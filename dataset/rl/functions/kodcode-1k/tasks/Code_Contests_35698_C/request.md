# max_non_overlapping_events

Returns the maximum number of non-overlapping hackathon events.

Parameters:
n (int): The number of hackathon events.
events (list): List of tuples, where each tuple contains two integers (si, ei) representing 
               the start and end times of each event.

Returns:
int: The maximum number of non-overlapping hackathon events that can be organized.

>>> max_non_overlapping_events(5, [(1, 4), (2, 5), (3, 6), (4, 7), (5, 8)])
2
>>> max_non_overlapping_events(3, [(1, 3), (2, 4), (3, 5)])
2

Implement `max_non_overlapping_events(n: int, events: list[tuple[int, int]]) -> int`.
