import from typing { List }
"""
    Moves all zeros in the given list to the end while maintaining the relative order of non-zero elements.
    """
def move_zeros_to_end(nums: list[int]) -> list[int] {
    non_zero_index = 0;
    for i in range(len(nums)) {
        if (nums[i] != 0) {
            nums[non_zero_index] = nums[i];
            non_zero_index += 1;
        }
    }
    for i in range(non_zero_index, len(nums)) {
        nums[i] = 0;
    }
    return nums;
}

