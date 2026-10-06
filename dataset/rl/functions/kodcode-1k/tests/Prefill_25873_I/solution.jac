"""
    Check if the given string is a palindrome.

    Args:
    s (str): The string to check.

    Returns:
    bool: True if the string is a palindrome, False otherwise.
    """
def is_palindrome(s: str) -> bool {
    s = s.lower().replace(" ", "");
    return (s == s[::-1]);
}

