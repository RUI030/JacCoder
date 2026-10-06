"""
    Returns the length of the longest contiguous sequence of 1's in the binary string S.
    """
def longestContiguousOnes(S: str) -> int {
    max_length = 0;
    current_length = 0;
    for char in S {
        if (char == '1') {
            current_length += 1;
            max_length = max(max_length, current_length);
        } else {
            current_length = 0;
        }
    }
    return max_length;
}

