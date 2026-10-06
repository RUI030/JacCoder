import math;
"""
    Calculate the estimated elevation difference between two points based on temperature difference.

    Parameters:
    - T1: Temperature at the lower point in degrees Celsius
    - T2: Temperature at the higher point in degrees Celsius

    Returns:
    - The estimated elevation difference in meters, rounded to the nearest integer.
    """
def elevation_difference(T1: int, T2: int) -> int {
    E = (T1 - T2) / 0.006;
    return round(E);
}

