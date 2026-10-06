"""
    Returns the minimum number of coins needed to make the given amount with the provided coin denominations.
    If it is not possible to make the exact amount, returns -1.
    """
def min_coins(amount: int, coins: list[int]) -> int {
    dp = [(amount + 1)] * (amount + 1);
    dp[0] = 0;
    for i in range(1, (amount + 1)) {
        for coin in coins {
            if ((i - coin) >= 0) {
                dp[i] = min(dp[i], (dp[(i - coin)] + 1));
            }
        }
    }
    return dp[amount] if (dp[amount] != (amount + 1)) else -1;
}

