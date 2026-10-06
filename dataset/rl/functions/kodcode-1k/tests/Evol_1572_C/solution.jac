"""
    Determines if the given result string is a perfect shuffle of str1 and str2.
    """
def is_perfect_shuffle(str1: str, str2: str, result: str) -> bool {
    n = len(str1);
    m = len(str2);
    k = len(result);
    if ((n + m) != k) {
        return False;
    }
    dp = [([False] * (m + 1)) for _ in range((n + 1))];
    dp[0][0] = True;
    for i in range((n + 1)) {
        for j in range((m + 1)) {
            if ((i > 0) and (str1[(i - 1)] == result[((i + j) - 1)])) {
                dp[i][j] = dp[i][j] or dp[(i - 1)][j];
            }
            if ((j > 0) and (str2[(j - 1)] == result[((i + j) - 1)])) {
                dp[i][j] = dp[i][j] or dp[i][(j - 1)];
            }
        }
    }
    return dp[n][m];
}

