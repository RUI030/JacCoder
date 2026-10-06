"""
    This function checks if a list of integers is sorted in non-decreasing order.

    n: integer, number of elements in the list
    arr: list of integers

    Returns "Sorted" if the list is sorted in non-decreasing order, otherwise returns "Unsorted".
    """
def check_sorted(n: int, arr: list[int]) -> str {
    for i in range(1, n) {
        if (arr[(i - 1)] > arr[i]) {
            return "Unsorted";
        }
    }
    return "Sorted";
}

