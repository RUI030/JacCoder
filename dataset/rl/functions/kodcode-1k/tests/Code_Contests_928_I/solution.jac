"""
    Determines if two strings are permutations of each other.

    Args:
    str1 (str): First string.
    str2 (str): Second string.

    Returns:
    bool: True if the strings are permutations of each other, False otherwise.
    """
def are_permutations(str1: str, str2: str) -> bool {
    if (len(str1) != len(str2)) {
        return False;
    }
    return (sorted(str1) == sorted(str2));
}

