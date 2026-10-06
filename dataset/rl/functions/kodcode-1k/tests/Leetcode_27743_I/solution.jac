"""
    Returns the starting index of the first contiguous subarray of length k that sums to target.
    If no such subarray exists, returns -1.
    """
def find_subarray_with_target(nums: list[int], target: int, k: int) -> int {
    n = len(nums);
    if (n < k) {
        return -1;
    }
    current_sum = sum(nums[:k]);
    if (current_sum == target) {
        return 0;
    }
    for i in range(1, ((n - k) + 1)) {
        current_sum = (current_sum - nums[(i - 1)]) + nums[((i + k) - 1)];
        if (current_sum == target) {
            return i;
        }
    }
    return -1;
}

