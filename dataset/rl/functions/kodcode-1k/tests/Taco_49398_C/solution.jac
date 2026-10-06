"""
    Returns the maximum profit that can be achieved by buying and selling fish.
    """
def maxProfit(prices: list[int]) -> int {
    max_profit = 0;
    for i in range(1, len(prices)) {
        if (prices[i] > prices[(i - 1)]) {
            max_profit += prices[i] - prices[(i - 1)];
        }
    }
    return max_profit;
}

