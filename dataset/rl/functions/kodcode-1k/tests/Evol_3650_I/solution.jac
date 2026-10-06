"""
    Rotates the list lst to the left by k positions.

    Parameters:
    lst (list): The list of elements to be rotated.
    k (int): The number of positions to rotate the list.

    Returns:
    list: The rotated list.
    """
def rotate_left(lst: list[int], k: int) -> list[int] {
    n = len(lst);
    if (n == 0) {
        return lst;
    }
    k = k % n;
    rotated_lst = lst[k:] + lst[:k];
    return rotated_lst;
}

