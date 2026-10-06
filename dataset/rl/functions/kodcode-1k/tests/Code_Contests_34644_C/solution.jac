"""
    Determines if `r` is a valid rotation of `s`.

    Parameters:
    s (str): The original string.
    r (str): The potential rotated version of the string.

    Returns:
    bool: True if `r` is a valid rotation of `s`, False otherwise.
    """
def is_rotated(s: str, r: str) -> bool {
    if (len(s) != len(r)) {
        return False;
    }
    return (r in (s + s));
}

