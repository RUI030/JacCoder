"""
    Calculate the maximum profit that can be achieved by trading stocks
    with multiple buy-sell transactions.

    Parameters:
    stocks (List[int]): List of stock prices per day.

    Returns:
    int: Maximum profit.
    """
def maxProfit(stocks: list[int]) -> int {
    if not stocks {
        return 0;
    }
    max_profit = 0;
    for i in range(1, len(stocks)) {
        if (stocks[i] > stocks[(i - 1)]) {
            max_profit += stocks[i] - stocks[(i - 1)];
        }
    }
    return max_profit;
}

