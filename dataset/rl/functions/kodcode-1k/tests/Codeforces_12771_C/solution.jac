"""
    Rotates the string s to the left by k positions.

    Parameters:
    s (str): The input string, consisting of lowercase English letters.
    k (int): The number of positions to rotate the string left by.

    Returns:
    str: The string after rotating it to the left by k positions.
    """
def rotate_string(s: str, k: int) -> str {
    length = len(s);
    if (length == 0) {
        return s;
    }
    k = k % length;
    return (s[k:] + s[:k]);
}

