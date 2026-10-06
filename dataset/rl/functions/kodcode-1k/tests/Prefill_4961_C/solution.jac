"""
    Finds the maximum sum of a contiguous subarray within a one-dimensional array of numbers.

    Args:
    nums (list): A list of integers.

    Returns:
    int: The maximum sum of a contiguous subarray.
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

