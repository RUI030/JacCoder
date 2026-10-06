"""
    Shifts all zeros to the end of the list while maintaining the relative order of the other elements.

    Args:
    nums (list of int): The list of integers to be modified.

    Returns:
    list of int: The modified list with all zeros moved to the end.
    """
def shiftZeroesToEnd(nums: list[int]) -> list[int] {
    last_non_zero_found_at = 0;
    for i in range(len(nums)) {
        if (nums[i] != 0) {
            nums[last_non_zero_found_at] = nums[i];
            last_non_zero_found_at += 1;
        }
    }
    for i in range(last_non_zero_found_at, len(nums)) {
        nums[i] = 0;
    }
    return nums;
}

