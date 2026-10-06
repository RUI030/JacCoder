"""
    Checks if two strings are anagrams of each other.

    :param str1: First string
    :param str2: Second string
    :return: True if the strings are anagrams, False otherwise
    """
def are_anagrams(str1: str, str2: str) -> bool {
    normalized_str1 = ''.join(sorted(str1.replace(" ", "").lower()));
    normalized_str2 = ''.join(sorted(str2.replace(" ", "").lower()));
    return (normalized_str1 == normalized_str2);
}

