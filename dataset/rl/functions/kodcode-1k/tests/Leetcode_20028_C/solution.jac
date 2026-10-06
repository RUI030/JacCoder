"""
    Determines if there exists an index k such that the sum of the first k elements
    is equal to the sum of the remaining elements in the array.

    Args:
    nums (list): List of integers.

    Returns:
    bool: True if such an index k exists, False otherwise.
    """
def is_balanced(nums: list[int]) -> bool {
    total_sum = sum(nums);
    left_sum = 0;
    for i in range((len(nums) - 1)) {
        left_sum += nums[i];
        right_sum = total_sum - left_sum;
        if (left_sum == right_sum) {
            return True;
        }
    }
    return False;
}

