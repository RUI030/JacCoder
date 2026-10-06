def longest_arith_seq_length(nums: list[int]) -> int {
    if (len(nums) == 0) {
        return 0;
    }
    longest_length = 1;
    dp = [{} for _ in range(len(nums))];
    for i in range(1, len(nums)) {
        for j in range(i) {
            diff = nums[i] - nums[j];
            if (diff in dp[j]) {
                dp[i][diff] = dp[j][diff] + 1;
            } else {
                dp[i][diff] = 2;
            }
            longest_length = max(longest_length, dp[i][diff]);
        }
    }
    return longest_length;
}

