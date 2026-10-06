"""
    Returns a new string where each character in the original string is repeated n times.
    """
def repeat_chars(text: str, n: int) -> str {
    return ''.join((char * n) for char in text);
}

