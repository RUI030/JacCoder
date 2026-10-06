"""
    Returns the length of the longest sequence of consecutive occurrences
    of the specified bit in the binary string.
    """
def longest_consecutive_bits(binary_string: str, bit: str) -> int {
    max_count = 0;
    current_count = 0;
    for char in binary_string {
        if (char == bit) {
            current_count += 1;
            if (current_count > max_count) {
                max_count = current_count;
            }
        } else {
            current_count = 0;
        }
    }
    return max_count;
}

