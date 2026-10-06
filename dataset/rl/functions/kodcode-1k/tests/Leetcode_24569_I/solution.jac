"""
    Returns the maximum profit that can be achieved by buying and selling earrings on different days.
    """
def max_profit(earrings: list[int]) -> int {
    if (not earrings or (len(earrings) == 1)) {
        return 0;
    }
    min_price = earrings[0];
    max_profit = 0;
    for price in earrings[1:] {
        if (price < min_price) {
            min_price = price;
        } elif ((price - min_price) > max_profit) {
            max_profit = price - min_price;
        }
    }
    return max_profit;
}

