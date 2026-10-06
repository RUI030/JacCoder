"""
    Checks if str1 is a subsequence of str2.

    Parameters:
    str1 (str): The string to check as a subsequence.
    str2 (str): The string to check against.

    Returns:
    bool: True if str1 is a subsequence of str2, False otherwise.
    """
def is_subsequence(str1: str, str2: str) -> bool {
    iter_str2 = iter(str2);
    return all((char in iter_str2) for char in str1);
}

