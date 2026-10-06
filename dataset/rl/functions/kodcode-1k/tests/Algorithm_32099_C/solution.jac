"""
    Computes the sum of transaction amounts over a rolling window of specified size.

    Args:
    - transactions: A list of integers representing transaction amounts.
    - window_size: An integer representing the size of the rolling window.

    Returns:
    - A list of integers representing the rolling window sums.
    """
def rolling_window_sum(transactions: list[int], window_size: int) -> list[int] {
    if not transactions {
        return [];
    }
    rolling_sum = [];
    current_window_sum = sum(transactions[:window_size]);
    rolling_sum.append(current_window_sum);
    for i in range(1, ((len(transactions) - window_size) + 1)) {
        current_window_sum += (
            transactions[((i + window_size) - 1)] - transactions[(i - 1)]
        );
        rolling_sum.append(current_window_sum);
    }
    return rolling_sum;
}

