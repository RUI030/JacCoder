"""
    Returns the sum of elements within the specified range [start, end].
    If start is greater than end or if indices are out of bounds, return None.

    :param arr: List[int] - the input array
    :param start: int - the start index
    :param end: int - the end index
    :return: int or None - the sum of elements in the range or None for invalid input
    """
def sum_in_range(arr: list[int], start: int, end: int) -> int | None {
    if (start > end) {
        return None;
    }
    if ((start < 0) or (end >= len(arr))) {
        return None;
    }
    return sum(arr[start:(end + 1)]);
}

