# predict_out_of_stock_day

Predict the day on which the product will run out of stock.

Parameters:
daily_sales (list of int): The daily sales of the product.
current_stock (int): The current stock level of the product.

Returns:
int: The day on which the product is predicted to run out of stock, or -1 if stock is sufficient.

>>> predict_out_of_stock_day([2, 3, 1, 5, 6], 10)
4
>>> predict_out_of_stock_day([1, 2, 3], 15)
-1

Implement `predict_out_of_stock_day(daily_sales: list[int], current_stock: int) -> int`.
