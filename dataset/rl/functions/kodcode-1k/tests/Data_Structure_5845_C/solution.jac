import from bisect { bisect_left }
"""
    Finds the length of the longest increasing subsequence in the given sequence.
    """
def compressed_longest_increasing_subsequence(sequence: list[int]) -> int {
    if not sequence {
        return 0;
    }
    dp = [];
    for number in sequence {
        pos = bisect_left(dp, number);
        if (pos == len(dp)) {
            dp.append(number);
        } else {
            dp[pos] = number;
        }
    }
    return len(dp);
}

