"""
    Calculate the Levenshtein distance between two strings s1 and s2.
    """
def levenshtein_distance(s1: str, s2: str) -> int {
    if (s1 == s2) {
        return 0;
    }
    (len_s1, len_s2) = (len(s1), len(s2));
    if (len_s1 == 0) {
        return len_s2;
    }
    if (len_s2 == 0) {
        return len_s1;
    }
    dp = [([0] * (len_s2 + 1)) for _ in range((len_s1 + 1))];
    for i in range((len_s1 + 1)) {
        dp[i][0] = i;
    }
    for j in range((len_s2 + 1)) {
        dp[0][j] = j;
    }
    for i in range(1, (len_s1 + 1)) {
        for j in range(1, (len_s2 + 1)) {
            if (s1[(i - 1)] == s2[(j - 1)]) {
                cost = 0;
            } else {
                cost = 1;
            }
            dp[i][j] = min(
                (dp[(i - 1)][j] + 1),
                (dp[i][(j - 1)] + 1),
                (dp[(i - 1)][(j - 1)] + cost)
            );
        }
    }
    return dp[len_s1][len_s2];
}

