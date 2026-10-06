"""
    Determines if a given pattern string matches the specified target string.
    The pattern string may include '?' (matches exactly one character) and '*'
    (matches zero or more characters).

    Parameters:
    target (str): The target string.
    pattern (str): The pattern string.

    Returns:
    bool: True if the pattern matches the target, False otherwise.
    """
def is_match(target: str, pattern: str) -> bool {
    (m, n) = (len(target), len(pattern));
    dp = [([False] * (n + 1)) for _ in range((m + 1))];
    dp[0][0] = True;
    for j in range(1, (n + 1)) {
        if (pattern[(j - 1)] == '*') {
            dp[0][j] = dp[0][(j - 1)];
        }
    }
    for i in range(1, (m + 1)) {
        for j in range(1, (n + 1)) {
            if ((pattern[(j - 1)] == target[(i - 1)]) or (pattern[(j - 1)] == '?')) {
                dp[i][j] = dp[(i - 1)][(j - 1)];
            } elif (pattern[(j - 1)] == '*') {
                dp[i][j] = dp[i][(j - 1)] or dp[(i - 1)][j];
            }
        }
    }
    return dp[m][n];
}

