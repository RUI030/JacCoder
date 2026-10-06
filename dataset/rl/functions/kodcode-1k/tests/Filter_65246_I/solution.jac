"""
    Reverses the order of characters in a string without using slicing.
    """
def reverse_string(s: str) -> str {
    reversed_str = "";
    for char in s {
        reversed_str = char + reversed_str;
    }
    return reversed_str;
}

