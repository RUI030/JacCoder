"""
    Returns the length of the longest subsequence that alternates between even and odd elements.
    """
def longest_alternating_subsequence(arr: list[int]) -> int {
    if not arr {
        return 0;
    }
    max_len = 1;
    current_len = 1;
    for i in range(1, len(arr)) {
        if (
            (((arr[(i - 1)] % 2) == 0) and ((arr[i] % 2) != 0))
            or (((arr[(i - 1)] % 2) != 0) and ((arr[i] % 2) == 0))
        ) {
            current_len += 1;
            max_len = max(max_len, current_len);
        } else {
            current_len = 1;
        }
    }
    return max_len;
}

