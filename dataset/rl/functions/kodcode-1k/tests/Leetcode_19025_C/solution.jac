"""
    Determine if it is possible to split the array into exactly two non-empty subarrays
    where both subarrays are non-decreasing.

    Parameters:
    arr (list of int): The array representing the height of buildings.

    Returns:
    bool: True if such a split is possible; False otherwise.
    """
def can_split_to_two_non_decreasing_subarrays(arr: list[int]) -> bool {
    n = len(arr);
    if (n < 2) {
        return False;
    }
    left = [0] * n;
    right = [0] * n;
    left[0] = arr[0];
    for i in range(1, n) {
        left[i] = max(left[(i - 1)], arr[i]);
    }
    right[-1] = arr[-1];
    for i in range((n - 2), -1, -1) {
        right[i] = min(right[(i + 1)], arr[i]);
    }
    for i in range(1, n) {
        if (left[(i - 1)] <= right[i]) {
            return True;
        }
    }
    return False;
}

