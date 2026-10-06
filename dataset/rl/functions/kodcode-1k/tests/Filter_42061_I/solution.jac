"""
    Returns the reverse of the given string s.
    """
def reverse_string(s: str) -> str {
    reversed_s = "";
    for char in s {
        reversed_s = char + reversed_s;
    }
    return reversed_s;
}

