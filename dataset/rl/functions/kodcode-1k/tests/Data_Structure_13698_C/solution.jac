import from typing { List }
"""
    Returns the index of the target in arr using binary search.
    If target is not present, returns -1.
    """
def find_index(arr: list[int], target: int) -> int {
    (left, right) = (0, (len(arr) - 1));
    while (left <= right) {
        mid = left + ((right - left) // 2);
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

