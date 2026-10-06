"""
    Returns the number of unique paths from top-left to bottom-right of an m x n grid.
    The robot can only move either down or right at any point in time.
    """
def unique_paths(m: int, n: int) -> int {
    if ((m == 1) or (n == 1)) {
        return 1;
    }
    dp = [([1] * n) for _ in range(m)];
    for i in range(1, m) {
        for j in range(1, n) {
            dp[i][j] = dp[(i - 1)][j] + dp[i][(j - 1)];
        }
    }
    return dp[(m - 1)][(n - 1)];
}

