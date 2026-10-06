"""
    Determines if two strings are anagrams of each other.

    An anagram is a rearrangement of the characters of one string to form another string.
    This function is case-sensitive and considers all characters, including spaces and punctuation marks.

    Args:
    s1 (str): The first string.
    s2 (str): The second string.

    Returns:
    bool: True if the strings are anagrams, False otherwise.
    """
def are_anagrams(s1: str, s2: str) -> bool {
    if (len(s1) != len(s2)) {
        return False;
    }
    import from collections { Counter }
    return (Counter(s1) == Counter(s2));
}

