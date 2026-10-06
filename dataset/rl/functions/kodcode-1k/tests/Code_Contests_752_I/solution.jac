def max_wood_pieces(n: int, heights: list[int]) -> int {
    if (n == 0) {
        return 0;
    }
    dp = [0] * n;
    if ((heights[0] % 2) == 0) {
        dp[0] = 1;
    }
    if (n == 1) {
        return dp[0];
    }
    if ((heights[1] % 2) == 0) {
        dp[1] = max(dp[0], 1);
    } else {
        dp[1] = dp[0];
    }
    for i in range(2, n) {
        if ((heights[i] % 2) == 0) {
            dp[i] = max(dp[(i - 1)], (dp[(i - 2)] + 1));
        } else {
            dp[i] = dp[(i - 1)];
        }
    }
    return dp[-1];
}

