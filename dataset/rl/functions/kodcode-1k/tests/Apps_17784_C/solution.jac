def max_coins(coins: list[int]) -> int {
    n = len(coins);
    dp = [([0] * n) for _ in range(n)];
    for length in range(1, (n + 1)) {
        for i in range(((n - length) + 1)) {
            j = (i + length) - 1;
            a = 0 if ((i + 2) > j) else dp[(i + 2)][j];
            b = 0 if ((i + 1) > (j - 1)) else dp[(i + 1)][(j - 1)];
            c = 0 if (i > (j - 2)) else dp[i][(j - 2)];
            dp[i][j] = max((coins[i] + min(a, b)), (coins[j] + min(b, c)));
        }
    }
    return dp[0][(n - 1)];
}

