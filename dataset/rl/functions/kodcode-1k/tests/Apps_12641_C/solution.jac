"""
    Returns a version of the string where all the adjacent duplicate characters
    have been reduced to a single character.

    Parameters:
    s (str): The input string

    Returns:
    str: The processed string with adjacent duplicates removed
    """
def remove_adjacent_duplicates(s: str) -> str {
    if not s {
        return "";
    }
    result = [s[0]];
    for char in s[1:] {
        if (char != result[-1]) {
            result.append(char);
        }
    }
    return ''.join(result);
}

