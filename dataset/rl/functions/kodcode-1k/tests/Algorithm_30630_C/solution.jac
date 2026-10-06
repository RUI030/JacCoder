import from typing { List }
"""
    Given a list of integers representing the prices of books and an integer representing
    the total amount of money, return the number of unique combinations of prices that sum
    up to the total amount.
    """
def num_combinations(prices: list[int], total_amount: int) -> int {
    dp = [0] * (total_amount + 1);
    dp[0] = 1;
    for price in prices {
        for amount in range(price, (total_amount + 1)) {
            dp[amount] += dp[(amount - price)];
        }
    }
    return dp[total_amount];
}

