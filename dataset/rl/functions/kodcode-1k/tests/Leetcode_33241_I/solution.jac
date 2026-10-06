"""
    Returns the number of distinct subsequences of s which equals t.
    """
def numDistinct(s: str, t: str) -> int {
    mod = (10 ** 9) + 7;
    (m, n) = (len(s), len(t));
    if (n == 0) {
        return 1;
    }
    if (m == 0) {
        return 0;
    }
    dp = [([0] * (n + 1)) for _ in range((m + 1))];
    for i in range((m + 1)) {
        dp[i][0] = 1;
    }
    for i in range(1, (m + 1)) {
        for j in range(1, (n + 1)) {
            if (s[(i - 1)] == t[(j - 1)]) {
                dp[i][j] = (dp[(i - 1)][(j - 1)] + dp[(i - 1)][j]) % mod;
            } else {
                dp[i][j] = dp[(i - 1)][j];
            }
        }
    }
    return dp[m][n];
}

