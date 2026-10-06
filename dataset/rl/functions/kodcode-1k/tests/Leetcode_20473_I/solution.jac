"""
    Returns the minimum number of steps to make the given string empty by removing a palindromic subsequence.
    """
def remove_palindromic_subsequences(s: str) -> int {
    if not s {
        return 0;
    }
    if (s == s[::-1]) {
        return 1;
    }
    return 2;
}

