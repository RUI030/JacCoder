"""
    Returns True if s2 is a rotation of s1, otherwise False.
    """
def is_rotation(s1: str, s2: str) -> bool {
    if (len(s1) != len(s2)) {
        return False;
    }
    return (s2 in (s1 + s1));
}

