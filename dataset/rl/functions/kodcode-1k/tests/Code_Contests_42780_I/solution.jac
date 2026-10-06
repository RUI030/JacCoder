"""
    Calculates the total price after applying the appropriate discount.

    Parameters:
    n (int): Number of books.
    prices (list): List of book prices.

    Returns:
    float: Total price after applying the discount.
    """
def calculate_total_price(n: int, prices: list[int]) -> float {
    if (n == 0) {
        return 0.0;
    }
    total_price = sum(prices);
    distinct_books = len(`set(prices));
    if (distinct_books >= 6) {
        discount = 0.2;
    } elif (distinct_books >= 4) {
        discount = 0.1;
    } elif (distinct_books >= 2) {
        discount = 0.05;
    } else {
        discount = 0.0;
    }
    total_price_after_discount = total_price * (1 - discount);
    return round(total_price_after_discount, 2);
}

