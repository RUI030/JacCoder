"""
    Implements the binary search algorithm to find target in sorted list arr.
    :param arr: List of sorted numbers
    :param target: Number to search for
    :return: Index of target if found, else -1
    """
def binary_search(arr: list[int], target: int) -> int {
    (left, right) = (0, (len(arr) - 1));
    while (left <= right) {
        mid = (left + right) // 2;
        if (arr[mid] == target) {
            return mid;
        } elif (arr[mid] < target) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    return -1;
}

