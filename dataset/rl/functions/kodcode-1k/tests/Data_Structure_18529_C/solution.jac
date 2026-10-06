import from typing { List }
"""
    Finds the minimum element in a rotated sorted array.

    :param arr: List of unique integers representing a rotated sorted array.
    :return: The minimum element in the array.
    """
def find_min_ignore_duplicates(arr: list[int]) -> int {
    (left, right) = (0, (len(arr) - 1));
    if (arr[left] < arr[right]) {
        return arr[left];
    }
    while (left < right) {
        mid = (left + right) // 2;
        if (arr[mid] > arr[right]) {
            left = mid + 1;
        } else {
            right = mid;
        }
    }
    return arr[left];
}

