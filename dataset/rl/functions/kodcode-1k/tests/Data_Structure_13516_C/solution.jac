"""
    This function returns the number of possible combinations of given coupon values that sum up to the target discount.
    """
def coupon_combinations(nums: list[int], target: int) -> int {
    dp = [0] * (target + 1);
    dp[0] = 1;
    for i in range(1, (target + 1)) {
        for num in nums {
            if ((i - num) >= 0) {
                dp[i] += dp[(i - num)];
            }
        }
    }
    return dp[target];
}
with entry {
    print(coupon_combinations([1, 2, 3], 4));
    print(coupon_combinations([2, 3, 6, 7], 7));
    print(coupon_combinations([2, 5], 3));
}

