"""
    Determines the maximum sum of any contiguous subarray within the array.

    Parameters:
    nums (list of int): The array of integers.

    Returns:
    int: The maximum sum of any contiguous subarray.
    """
def max_subarray_sum(nums: list[int]) -> int {
    if not nums {
        return 0;
    }
    max_sum = current_sum=nums[0];
    for num in nums[1:] {
        current_sum = max(num, (current_sum + num));
        max_sum = max(max_sum, current_sum);
    }
    return max_sum;
}

