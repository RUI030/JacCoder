"""
    Rotates the array to the right k times.

    Args:
    arr (list of int): The array to rotate.
    k (int): The number of rotations.

    Returns:
    list of int: The rotated array.
    """
def rotate_right(arr: list[int], k: int) -> list[int] {
    if not arr {
        return arr;
    }
    n = len(arr);
    k = k % n;
    if (k == 0) {
        return arr;
    }
    return (arr[-k:] + arr[:-k]);
}

