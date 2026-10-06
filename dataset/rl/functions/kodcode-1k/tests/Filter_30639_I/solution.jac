"""
    Perform a circular shift on the list lst by n positions.

    Parameters:
    lst (list of int): The list of integers to be shifted.
    n (int): The number of positions to shift.
    direction (bool): The direction of the shift. True for left shift, False for right shift.

    Returns:
    list: The modified list after the circular shift.
    """
def circular_shift(lst: list[int], n: int, direction: bool) -> list[int] {
    if not lst {
        return lst;
    }
    n = n % len(lst);
    if direction {
        return (lst[n:] + lst[:n]);
    } else {
        return (lst[-n:] + lst[:-n]);
    }
}

