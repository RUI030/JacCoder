def min_cuts_to_non_decreasing(trees: list[int]) -> int {
    n = len(trees);
    dp = [1] * n;
    for i in range(1, n) {
        for j in range(i) {
            if (trees[i] >= trees[j]) {
                dp[i] = max(dp[i], (dp[j] + 1));
            }
        }
    }
    return (n - max(dp));
}

