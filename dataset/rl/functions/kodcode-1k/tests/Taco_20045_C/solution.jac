"""
    Given an integer array, return an array that contains the squares of each
    number, sorted in non-decreasing order.

    :param arr: List[int] - Input list of integers.
    :return: List[int] - Sorted list of squared integers.
    """
def sorted_squares(arr: list[int]) -> list[int] {
    return sorted((x * x) for x in arr);
}

