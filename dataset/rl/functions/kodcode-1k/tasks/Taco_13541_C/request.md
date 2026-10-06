# average_speed

Calculate the average speed of participants given distances and times arrays.
The speed for each participant is calculated as distance/time.
The average speed is the mean of these individual speeds, rounded down to the nearest integer.

Parameters:
distances (list of int): Distances run by the participants in kilometers.
times (list of int): Times taken by the participants in hours.

Returns:
int: The average speed of the participants rounded down to the nearest integer.

Examples:
>>> average_speed([10, 20, 30], [1, 2, 3])
10
>>> average_speed([50], [2])
25

Implement `average_speed(distances: list[int], times: list[int]) -> int`.
