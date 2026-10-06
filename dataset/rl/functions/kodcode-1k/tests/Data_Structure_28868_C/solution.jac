"""
    Determines if t is an anagram of s considering case insensitivity and all printable ASCII characters.

    :param s: str
    :param t: str
    :return: bool
    """
def is_anagram_extended(s: str, t: str) -> bool {
    import from collections { Counter }
    s = s.lower();
    t = t.lower();
    return (Counter(s) == Counter(t));
}

