import math;
"""
    Returns the number of unique paths from the top-left corner to the
    bottom-right corner of an m x n grid.
    """
def unique_paths(m: int, n: int) -> int {
    return (
        math.factorial(((m + n) - 2))
        // (math.factorial((m - 1)) * math.factorial((n - 1)))
    );
}

