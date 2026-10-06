"""
    Returns the number of completely full glasses after `t` seconds
    in an `m` x `n` grid.

    Args:
    - m (int): The number of rows in the grid.
    - n (int): The number of columns in the grid.
    - t (int): The number of seconds Sarah will be pouring punch.

    Returns:
    - int: The number of completely full glasses.
    """
def count_full_glasses(m: int, n: int, t: int) -> int {
    total_glasses = m * n;
    return min(total_glasses, t);
}

