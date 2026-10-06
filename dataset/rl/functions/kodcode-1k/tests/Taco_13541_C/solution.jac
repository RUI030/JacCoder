import math;
"""
    Calculate the average speed of participants given distances and times arrays.
    The speed for each participant is calculated as distance/time.
    The average speed is the mean of these individual speeds, rounded down to the nearest integer.

    Parameters:
    distances (list of int): Distances run by the participants in kilometers.
    times (list of int): Times taken by the participants in hours.

    Returns:
    int: The average speed of the participants rounded down to the nearest integer.
    """
def average_speed(distances: list[int], times: list[int]) -> int {
    total_speed = sum((d / t) for (d, t) in zip(distances, times));
    average_speed = total_speed / len(distances);
    return math.floor(average_speed);
}

