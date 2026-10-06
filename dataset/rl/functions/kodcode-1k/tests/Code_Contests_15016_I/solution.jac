"""
    Returns the minimum cost to make all toy structures the same height.
    The cost is computed by transforming all heights to the same median value.

    Parameters:
    n (int): number of toy structures.
    heights (list): list of heights of the toy structures.

    Returns:
    int: minimum cost
    """
def min_cost_to_equal_heights(n: int, heights: list[int]) -> int {
    heights.sort();
    median = heights[(n // 2)];
    total_cost = sum(abs((height - median)) for height in heights);
    return total_cost;
}

