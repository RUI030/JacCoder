"""
    Returns the maximum sum of non-adjacent elements in the array.
    """
def max_non_adjacent_sum(nums: list[int]) -> int {
    if not nums {
        return 0;
    }
    n = len(nums);
    if (n == 1) {
        return nums[0];
    }
    dp = [0] * n;
    dp[0] = nums[0];
    dp[1] = max(nums[0], nums[1]);
    for i in range(2, n) {
        dp[i] = max(dp[(i - 1)], (dp[(i - 2)] + nums[i]));
    }
    return dp[-1];
}

