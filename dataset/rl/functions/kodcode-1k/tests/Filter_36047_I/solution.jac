"""
    A recursive function to reverse a string without using any built-in function or additional temporary variables.
    """
def reverse_string(s: str) -> str {
    if (len(s) <= 1) {
        return s;
    }
    return (s[-1] + reverse_string(s[:-1]));
}

