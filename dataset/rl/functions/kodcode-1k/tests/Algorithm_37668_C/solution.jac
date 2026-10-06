"""
    Merges two strings by alternating their characters. If one string is longer
    than the other, append the remaining characters of the longer string at
    the end of the result.

    Args:
    s1 (str): The first input string.
    s2 (str): The second input string.

    Returns:
    str: The interleaved result of s1 and s2.
    """
def string_interleave(s1: str, s2: str) -> str {
    result = [];
    (len1, len2) = (len(s1), len(s2));
    min_len = min(len1, len2);
    for i in range(min_len) {
        result.append(s1[i]);
        result.append(s2[i]);
    }
    if (len1 > len2) {
        result.append(s1[min_len:]);
    } elif (len2 > len1) {
        result.append(s2[min_len:]);
    }
    return ''.join(result);
}

