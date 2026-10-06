# rolling_window_sum

Computes the sum of transaction amounts over a rolling window of specified size.

Args:
- transactions: A list of integers representing transaction amounts.
- window_size: An integer representing the size of the rolling window.

Returns:
- A list of integers representing the rolling window sums.

>>> rolling_window_sum([10, 20, 30, 40, 50], 3)
[60, 90, 120]
>>> rolling_window_sum([5, 15, 25, 35], 2)
[20, 40, 60]

Implement `rolling_window_sum(transactions: list[int], window_size: int) -> list[int]`.
