"""
    Returns the lexicographically smallest substring of length n from the given string s.
    """
def smallest_lexicographical_substring(s: str, n: int) -> str {
    if (n > len(s)) {
        return "";
    }
    smallest_substring = s[:n];
    for i in range(1, ((len(s) - n) + 1)) {
        current_substring = s[i:(i + n)];
        if (current_substring < smallest_substring) {
            smallest_substring = current_substring;
        }
    }
    return smallest_substring;
}

