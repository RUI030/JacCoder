"""
    Returns the length of the longest subarray where the bitwise AND of all elements is greater than zero.
    """
def longest_subarray_bitwise_and_greater_than_zero(n: int, arr: list[int]) -> int {
    max_len = 0;
    current_len = 0;
    for num in arr {
        if (num > 0) {
            current_len += 1;
            max_len = max(max_len, current_len);
        } else {
            current_len = 0;
        }
    }
    return max_len;
}

