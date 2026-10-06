"""
    Finds the minimum possible absolute difference between the sums of two parts of the array.
    """
def find_min_diff(arr: list[int]) -> int {
    total_sum = sum(arr);
    n = len(arr);
    dp = [([False] * ((total_sum // 2) + 1)) for _ in range((n + 1))];
    for i in range((n + 1)) {
        dp[i][0] = True;
    }
    for i in range(1, (n + 1)) {
        for j in range(1, ((total_sum // 2) + 1)) {
            dp[i][j] = dp[(i - 1)][j];
            if (arr[(i - 1)] <= j) {
                dp[i][j] = dp[i][j] or dp[(i - 1)][(j - arr[(i - 1)])];
            }
        }
    }
    for j in range((total_sum // 2), -1, -1) {
        if dp[n][j] {
            sum1 = j;
            break;
        }
    }
    sum2 = total_sum - sum1;
    return abs((sum2 - sum1));
}

