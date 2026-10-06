"""
    Rotates the list `lst` to the right by `k` steps.

    Args:
    lst : list of integers
    k : integer, number of steps to rotate the list

    Returns:
    list : rotated list
    """
def rotate_right(lst: list[int], k: int) -> list[int] {
    if not lst {
        return lst;
    }
    n = len(lst);
    k = k % n;
    return (lst[-k:] + lst[:-k]);
}

