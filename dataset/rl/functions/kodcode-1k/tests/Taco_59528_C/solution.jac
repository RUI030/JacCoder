"""
    Given an unsorted array of integers, return the shortest subarray such that sorting
    it results in the entire array being sorted.

    Parameters:
    nums (List[int]): The input list of integers.

    Returns:
    Tuple[int, int]: The start and end indices of the smallest such subarray
    that, when sorted, makes the whole array sorted. If the array is already
    sorted, returns (-1, -1).
    """
def find_unsorted_subarray(nums: list[int]) -> tuple[int, int] {
    n = len(nums);
    if (n <= 1) {
        return (-1, -1);
    }
    (start, end) = (-1, -1);
    for i in range(1, n) {
        if (nums[i] < nums[(i - 1)]) {
            start = i - 1;
            break;
        }
    }
    if (start == -1) {
        return (-1, -1);
    }
    for j in range((n - 2), -1, -1) {
        if (nums[j] > nums[(j + 1)]) {
            end = j + 1;
            break;
        }
    }
    min_val = min(nums[start:(end + 1)]);
    max_val = max(nums[start:(end + 1)]);
    for i in range(0, start) {
        if (nums[i] > min_val) {
            start = i;
            break;
        }
    }
    for j in range((n - 1), end, -1) {
        if (nums[j] < max_val) {
            end = j;
            break;
        }
    }
    return (start, end);
}

