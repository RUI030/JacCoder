"""
    Returns the total cost of items after applying the discount based on given rules.

    :param item_prices: List[int] representing the prices of the items
    :return: float representing the final amount in dollars after discounts
    """
def calculate_final_amount(item_prices: list[int]) -> float {
    total_cost = sum(item_prices);
    if (total_cost > 200) {
        discount = 0.2;
    } elif (total_cost >= 100) {
        discount = 0.1;
    } else {
        discount = 0.0;
    }
    final_amount = total_cost - (total_cost * discount);
    return round(final_amount, 2);
}

