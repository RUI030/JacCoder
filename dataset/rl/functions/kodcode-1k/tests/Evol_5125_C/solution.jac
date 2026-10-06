"""
    Rotates the elements of the array to the right by k positions.

    Parameters:
    arr (list): The array to rotate.
    k (int): The number of positions to rotate the array.

    Returns:
    list: The rotated array.
    """
def rotate_array(arr: list[int], k: int) -> list[int] {
    if (not arr or (k <= 0)) {
        return arr;
    }
    n = len(arr);
    k %= n;
    return (arr[-k:] + arr[:-k]);
}

