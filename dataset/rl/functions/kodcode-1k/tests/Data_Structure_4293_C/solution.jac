def is_merge(s: str, part1: str, part2: str) -> bool {
    (len_s, len_p1, len_p2) = (len(s), len(part1), len(part2));
    if (len_s != (len_p1 + len_p2)) {
        return False;
    }
    dp = [([False] * (len_p2 + 1)) for _ in range((len_p1 + 1))];
    dp[0][0] = True;
    for i in range((len_p1 + 1)) {
        for j in range((len_p2 + 1)) {
            if ((i > 0) and dp[(i - 1)][j] and (s[((i + j) - 1)] == part1[(i - 1)])) {
                dp[i][j] = True;
            }
            if ((j > 0) and dp[i][(j - 1)] and (s[((i + j) - 1)] == part2[(j - 1)])) {
                dp[i][j] = True;
            }
        }
    }
    return dp[len_p1][len_p2];
}

