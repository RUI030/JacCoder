"""
    This function returns the pivot index of a rotated sorted array. If the array is not rotated,
    it returns 0.
    """
def find_pivot_index(arr: list[int]) -> int {
    if not arr {
        return -1;
    }
    (low, high) = (0, (len(arr) - 1));
    while (low < high) {
        mid = (low + high) // 2;
        if (arr[mid] > arr[high]) {
            low = mid + 1;
        } else {
            high = mid;
        }
    }
    return low;
}

