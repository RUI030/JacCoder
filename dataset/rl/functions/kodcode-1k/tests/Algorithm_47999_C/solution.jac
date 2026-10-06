def longest_multiple_subsequence(lst: list[int]) -> int {
    n = len(lst);
    if (n == 1) {
        return 1;
    }
    lst.sort();
    dp = [1] * n;
    for i in range(1, n) {
        for j in range(i) {
            if ((lst[i] % lst[j]) == 0) {
                dp[i] = max(dp[i], (dp[j] + 1));
            }
        }
    }
    return max(dp);
}

