"""
    Calculates the number of unique paths in a grid from the top-left
    corner to the bottom-right corner. You can only move either down or right.

    :param m: Number of rows in the grid
    :param n: Number of columns in the grid
    :return: Number of unique paths
    """
def count_paths(m: int, n: int) -> int {
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

