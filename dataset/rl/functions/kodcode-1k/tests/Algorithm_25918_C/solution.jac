"""
    Check whether two strings are anagrams of each other.

    Args:
    s1 (str): First string.
    s2 (str): Second string.

    Returns:
    bool: True if the strings are anagrams, False otherwise.
    """
def are_anagrams(s1: str, s2: str) -> bool {
    s1 = s1.replace(" ", "").lower();
    s2 = s2.replace(" ", "").lower();
    return (sorted(s1) == sorted(s2));
}

