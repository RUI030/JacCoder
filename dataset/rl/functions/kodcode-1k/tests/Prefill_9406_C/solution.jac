"""
    Reverses the given string without using slicing.

    Args:
    s (str): input string to be reversed

    Returns:
    str: reversed string
    """
def reverse_string(s: str) -> str {
    reversed_str = '';
    for char in s {
        reversed_str = char + reversed_str;
    }
    return reversed_str;
}

