"""
    Sorts a list of prices in descending order.

    :param prices: List of floating point numbers representing prices.
    :return: List of prices sorted in descending order.
    """
def sort_prices_descending(prices: list[float]) -> list[float] {
    return sorted(prices, reverse=True);
}

