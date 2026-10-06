"""
    Perform a binary search to find the index of `value` in the sorted `arr`.
    If `value` is not found, return -1.

    :param arr: List of sorted integers.
    :param value: Integer value to search for.
    :return: Index of `value` in `arr` if found, otherwise -1.
    """
def binary_search(arr: list[int], value: int) -> int {
    (low, high) = (0, (len(arr) - 1));
    while (low <= high) {
        mid = (low + high) // 2;
        if (arr[mid] == value) {
            return mid;
        } elif (arr[mid] < value) {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }
    return -1;
}

