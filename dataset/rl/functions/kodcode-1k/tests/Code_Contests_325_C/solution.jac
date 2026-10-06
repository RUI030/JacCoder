"""
    Returns the maximum number of consecutive dishes that can be prepared
    starting from the first customer's request and the total preparation time.

    Parameters:
    n (int): The number of customer requests.
    times (list of int): The time it takes to prepare each dish.

    Returns:
    tuple: (max_dishes, total_time) where max_dishes is the maximum number of dishes
    that can be prepared consecutively, and total_time is the total preparation time for
    those dishes.
    """
def max_consecutive_dishes(n: int, times: list[int]) -> tuple[int, int] {
    max_dishes = n;
    total_time = sum(times);
    return (max_dishes, total_time);
}

