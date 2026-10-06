"""
    Computes the minimum number of operations required to convert string s into string t using
    insertion, deletion, or substitution of a single character.
    """
def min_operations(s: str, t: str) -> int {
    (m, n) = (len(s), len(t));
    dp = [([0] * (n + 1)) for _ in range((m + 1))];
    for i in range((m + 1)) {
        for j in range((n + 1)) {
            if (i == 0) {
                dp[i][j] = j;
            } elif (j == 0) {
                dp[i][j] = i;
            } elif (s[(i - 1)] == t[(j - 1)]) {
                dp[i][j] = dp[(i - 1)][(j - 1)];
            } else {
                dp[i][j] = (
                    1 + min(dp[i][(j - 1)], dp[(i - 1)][j], dp[(i - 1)][(j - 1)])
                );
            }
        }
    }
    return dp[m][n];
}

