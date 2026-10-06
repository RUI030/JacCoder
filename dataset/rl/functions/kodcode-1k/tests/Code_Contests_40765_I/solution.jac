"""
    Calculate the maximum distance from the starting point the car can be after n days.

    Parameters:
    n (int): The number of days
    distances (list of int): The list of distances d_i, where d_i can be positive (forward) or negative (backward)

    Returns:
    int: The maximum distance from the starting point
    """
def max_distance(n: int, distances: list[int]) -> int {
    return sum(abs(d) for d in distances);
}

