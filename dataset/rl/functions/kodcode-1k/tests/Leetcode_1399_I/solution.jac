"""
    Returns the largest-valued odd integer (as a string) that is a non-empty
    substring of `num`, or an empty string if no odd integer exists.
    """
def largest_odd_substring(num: str) -> str {
    for i in range((len(num) - 1), -1, -1) {
        if ((int(num[i]) % 2) != 0) {
            return num[:(i + 1)];
        }
    }
    return "";
}

