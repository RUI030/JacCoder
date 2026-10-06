"""
    Predict the day on which the product will run out of stock.

    Parameters:
    daily_sales (list of int): The daily sales of the product.
    current_stock (int): The current stock level of the product.

    Returns:
    int: The day on which the product is predicted to run out of stock, or -1 if stock is sufficient.
    """
def predict_out_of_stock_day(daily_sales: list[int], current_stock: int) -> int {
    for (day, sales) in enumerate(daily_sales) {
        current_stock -= sales;
        if (current_stock < 0) {
            return (day + 1);
        }
    }
    return -1;
}

