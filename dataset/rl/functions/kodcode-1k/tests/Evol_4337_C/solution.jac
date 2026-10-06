"""
    Returns the maximum sum of k consecutive elements in the list nums.
    If k is larger than the list length or any other edge case, return 0.
    """
def max_consecutive_sum(nums: list[int], k: int) -> int {
    if ((k > len(nums)) or (k <= 0)) {
        return 0;
    }
    max_sum = current_sum=sum(nums[:k]);
    for i in range(k, len(nums)) {
        current_sum += nums[i] - nums[(i - k)];
        if (current_sum > max_sum) {
            max_sum = current_sum;
        }
    }
    return max_sum;
}

