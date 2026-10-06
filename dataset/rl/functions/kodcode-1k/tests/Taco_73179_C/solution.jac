"""
    Shifts the elements of the array to the right by one position,
    moving the last element to the first position.

    Parameters:
    n (int): The size of the array.
    arr (list of int): The array to be shifted.

    Returns:
    list of int: The shifted array.
    """
def shift_array_right(n: int, arr: list[int]) -> list[int] {
    if (n == 0) {
        return arr;
    }
    return ([arr[-1]] + arr[:-1]);
}

