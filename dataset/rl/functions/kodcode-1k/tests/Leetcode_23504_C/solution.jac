def maxProfit(k: int, prices: list[int]) -> int {
    n = len(prices);
    if (n == 0) {
        return 0;
    }
    if (k >= (n // 2)) {
        return sum(
            (x - y)
            for (x, y) in zip(prices[1:], prices[:-1])
            if (x > y)
        );
    }
    profits = [([0] * n) for _ in range((k + 1))];
    for i in range(1, (k + 1)) {
        max_profit_so_far = -prices[0];
        for j in range(1, n) {
            profits[i][j] = max(profits[i][(j - 1)], (prices[j] + max_profit_so_far));
            max_profit_so_far = max(
                max_profit_so_far, (profits[(i - 1)][j] - prices[j])
            );
        }
    }
    return profits[k][(n - 1)];
}

