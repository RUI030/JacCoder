"""
    Returns the minimum energy required for Vlad to travel from the
    leftmost point to the rightmost point of the landscape.
    """
def min_energy_to_travel(n: int, heights: list[int]) -> int {
    return abs((heights[0] - heights[-1]));
}

