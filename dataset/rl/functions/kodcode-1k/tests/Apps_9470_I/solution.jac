"""
    Determine if the given string s is a palindrome, ignoring cases, spaces, and non-alphanumeric characters.

    Parameters:
    s (str): The string to be checked.

    Returns:
    bool: True if s is a palindrome, False otherwise.
    """
def is_palindrome(s: str) -> bool {
    filtered_s = ''.join(
        char.lower()
        for char in s
        if char.isalnum()
    );
    return (filtered_s == filtered_s[::-1]);
}

