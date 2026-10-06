"""
    Find two numbers in the sorted array `arr` that sum up to `target`.
    Return the 1-based indices of these two numbers. If no such indices
    exist, return -1, -1.
    """
def two_sum_sorted(arr: list[int], target: int) -> tuple[int, int] {
    (left, right) = (0, (len(arr) - 1));
    while (left < right) {
        curr_sum = arr[left] + arr[right];
        if (curr_sum == target) {
            return ((left + 1), (right + 1));
        } elif (curr_sum < target) {
            left += 1;
        } else {
            right -= 1;
        }
    }
    return (-1, -1);
}

