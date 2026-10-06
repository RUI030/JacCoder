"""
    Returns the number of unique paths from the top-left corner to the bottom-right corner
    of an m x n grid, moving only right or down.

    Parameters:
    m (int): number of rows
    n (int): number of columns

    Returns:
    int: number of unique paths
    """
def unique_paths(m: int, n: int) -> int {
    dp = [([1] * n) for _ in range(m)];
    for i in range(1, m) {
        for j in range(1, n) {
            dp[i][j] = dp[(i - 1)][j] + dp[i][(j - 1)];
        }
    }
    return dp[(m - 1)][(n - 1)];
}

