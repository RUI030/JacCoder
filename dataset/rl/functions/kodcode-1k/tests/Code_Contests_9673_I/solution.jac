"""
    Returns "YES" if s2 is a rotation of s1, otherwise returns "NO".
    """
def is_rotation(s1: str, s2: str) -> str {
    if (len(s1) != len(s2)) {
        return "NO";
    }
    combined = s1 + s1;
    if (s2 in combined) {
        return "YES";
    } else {
        return "NO";
    }
}

