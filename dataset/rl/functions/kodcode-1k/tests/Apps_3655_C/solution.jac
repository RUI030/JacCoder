import from typing { List }
def unique_paths_with_obstacles(grid: list[list[int]]) -> int {
    if (not grid or (grid[0][0] == 1) or (grid[-1][-1] == 1)) {
        return 0;
    }
    (m, n) = (len(grid), len(grid[0]));
    dp = [([0] * n) for _ in range(m)];
    dp[0][0] = 1;
    for i in range(m) {
        for j in range(n) {
            if (grid[i][j] == 1) {
                dp[i][j] = 0;
            } else {
                if (i > 0) {
                    dp[i][j] += dp[(i - 1)][j];
                }
                if (j > 0) {
                    dp[i][j] += dp[i][(j - 1)];
                }
            }
        }
    }
    return dp[-1][-1];
}

