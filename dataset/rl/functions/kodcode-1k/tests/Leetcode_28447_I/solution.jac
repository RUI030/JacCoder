"""
    Returns the lexicographically smallest substring of length k from the given string s.
    """
def lexicographically_smallest_substring(s: str, k: int) -> str {
    n = len(s);
    if (k > n) {
        return "";
    }
    smallest_substring = s[:k];
    for i in range(1, ((n - k) + 1)) {
        current_substring = s[i:(i + k)];
        if (current_substring < smallest_substring) {
            smallest_substring = current_substring;
        }
    }
    return smallest_substring;
}

