"""
    Performs binary search on a rotated sorted array.

    :param arr: List[int], a rotated sorted array
    :param target: int, the target value to search for
    :return: int, the index of target in the array if present, otherwise -1
    """
def binary_search_rotated(arr: list[int], target: int) -> int {
    if not arr {
        return -1;
    }
    (left, right) = (0, (len(arr) - 1));
    while (left <= right) {
        mid = (left + right) // 2;
        if (arr[mid] == target) {
            return mid;
        }
        if (arr[left] <= arr[mid]) {
            if (arr[left] <= target < arr[mid]) {
                right = mid - 1;
            } else {
                left = mid + 1;
            }
        } elif (arr[mid] < target <= arr[right]) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    return -1;
}

