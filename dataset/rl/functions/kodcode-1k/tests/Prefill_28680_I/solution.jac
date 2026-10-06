"""
    Returns the maximum number of occurrences of any substring of length K in the string S.
    """
def max_occurrences(S: str, K: int) -> int {
    if ((K <= 0) or (K > len(S))) {
        return 0;
    }
    substring_count = {};
    for i in range(((len(S) - K) + 1)) {
        substr = S[i:(i + K)];
        if (substr in substring_count) {
            substring_count[substr] += 1;
        } else {
            substring_count[substr] = 1;
        }
    }
    return max(substring_count.values());
}

