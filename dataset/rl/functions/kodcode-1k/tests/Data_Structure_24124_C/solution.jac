import from typing { List }
"""
    Returns the number of ways to make change for a given value using the provided coin denominations.
    """
def count(coins: list[int], value: int) -> int {
    dp = [0] * (value + 1);
    dp[0] = 1;
    for coin in coins {
        for x in range(coin, (value + 1)) {
            dp[x] += dp[(x - coin)];
        }
    }
    return dp[value];
}

