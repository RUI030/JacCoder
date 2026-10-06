"""
    Returns True if the string s is a palindrome, False otherwise.
    """
def is_palindrome(s: str) -> bool {
    s = ''.join(
        char.lower()
        for char in s
        if char.isalnum()
    );
    return (s == s[::-1]);
}

