"""
    Returns the length of the longest contiguous subarray where all elements have the same parity (odd or even).
    """
def longest_same_parity_subarray(nums: list[int]) -> int {
    if not nums {
        return 0;
    }
    max_length = 1;
    current_length = 1;
    for i in range(1, len(nums)) {
        if ((nums[i] % 2) == (nums[(i - 1)] % 2)) {
            current_length += 1;
            max_length = max(max_length, current_length);
        } else {
            current_length = 1;
        }
    }
    return max_length;
}

