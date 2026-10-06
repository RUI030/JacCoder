"""
    Returns the minimum difference between sums of two subarrays.
    """
def partitionArray(arr: list[int], N: int) -> int {
    total_sum = sum(arr);
    target = total_sum // 2;
    dp = [False] * (target + 1);
    dp[0] = True;
    for num in arr {
        for j in range(target, (num - 1), -1) {
            dp[j] = dp[j] or dp[(j - num)];
        }
    }
    for i in range(target, -1, -1) {
        if dp[i] {
            return (total_sum - (2 * i));
        }
    }
    return total_sum;
}

