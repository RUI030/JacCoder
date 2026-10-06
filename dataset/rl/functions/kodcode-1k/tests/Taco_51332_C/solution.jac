"""
    This function returns the length of the longest palindromic subsequence in the given string s.
    """
def longest_palindromic_subsequence(s: str) -> int {
    n = len(s);
    if (n == 0) {
        return 0;
    }
    dp = [([0] * n) for _ in range(n)];
    for i in range(n) {
        dp[i][i] = 1;
    }
    for cl in range(2, (n + 1)) {
        for i in range(((n - cl) + 1)) {
            j = (i + cl) - 1;
            if ((s[i] == s[j]) and (cl == 2)) {
                dp[i][j] = 2;
            } elif (s[i] == s[j]) {
                dp[i][j] = dp[(i + 1)][(j - 1)] + 2;
            } else {
                dp[i][j] = max(dp[i][(j - 1)], dp[(i + 1)][j]);
            }
        }
    }
    return dp[0][(n - 1)];
}

