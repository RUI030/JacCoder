"""
    Returns the maximum sum of any contiguous subarray using Kadane's algorithm.

    :param nums: List of integers
    :return:Integer maximum sum of any contiguous subarray
    """
def max_subarray_sum(nums: list[int]) -> int {
    if not nums {
        return 0;
    }
    current_sum = max_sum=nums[0];
    for num in nums[1:] {
        current_sum = max(num, (current_sum + num));
        max_sum = max(max_sum, current_sum);
    }
    return max_sum;
}

