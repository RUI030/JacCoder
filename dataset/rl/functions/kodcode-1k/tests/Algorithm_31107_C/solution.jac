"""
    Returns the length of the longest contiguous sequence of zeros in the given binary string.
    """
def longest_zero_sequence(binary_str: str) -> int {
    zero_sequences = binary_str.split('1');
    longest_sequence = max(len(seq) for seq in zero_sequences);
    return longest_sequence;
}

