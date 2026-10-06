"""
    Returns the longest common subsequence (LCS) between two strings.
    If there are multiple LCS of the same length, returns the one that appears first lexicographically.
    """
def longest_common_subsequence(str1: str, str2: str) -> str {
    (n, m) = (len(str1), len(str2));
    dp = [["" for _ in range((m + 1))] for __ in range((n + 1))];
    for i in range(1, (n + 1)) {
        for j in range(1, (m + 1)) {
            if (str1[(i - 1)] == str2[(j - 1)]) {
                dp[i][j] = dp[(i - 1)][(j - 1)] + str1[(i - 1)];
            } elif (len(dp[(i - 1)][j]) > len(dp[i][(j - 1)])) {
                dp[i][j] = dp[(i - 1)][j];
            } elif (len(dp[(i - 1)][j]) < len(dp[i][(j - 1)])) {
                dp[i][j] = dp[i][(j - 1)];
            } else {
                dp[i][j] = min(dp[(i - 1)][j], dp[i][(j - 1)]);
            }
        }
    }
    return dp[n][m];
}

