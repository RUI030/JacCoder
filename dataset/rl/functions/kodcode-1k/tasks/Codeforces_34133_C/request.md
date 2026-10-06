# amusement_park_finish_times

Determines the finish time for each person in the queue.

Args:
n (int): Number of people in the queue.
arrival_times (list): List of integers representing arrival times.
durations (list): List of integers representing durations of the ride.

Returns:
list: List of integers representing the finish times for each person.

>>> amusement_park_finish_times(1, [0], [5])
[5]
>>> amusement_park_finish_times(3, [0, 2, 4], [5, 3, 2])
[5, 8, 10]

Implement `amusement_park_finish_times(n: int, arrival_times: list[int], durations: list[int]) -> list[int]`.
