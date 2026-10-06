"""
    Returns the maximum sum of k consecutive elements in the array nums.
    If nums has fewer than k elements, returns -1.
    """
def max_sum_of_k_consecutive(nums: list[int], k: int) -> int {
    n = len(nums);
    if (n < k) {
        return -1;
    }
    max_sum = sum(nums[:k]);
    current_sum = max_sum;
    for i in range(k, n) {
        current_sum += nums[i] - nums[(i - k)];
        if (current_sum > max_sum) {
            max_sum = current_sum;
        }
    }
    return max_sum;
}

