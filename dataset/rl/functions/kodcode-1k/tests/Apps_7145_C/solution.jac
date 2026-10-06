"""
    Determine if string t is an anagram of string s.

    :param s: str
    :param t: str
    :return: bool
    """
def is_anagram(s: str, t: str) -> bool {
    if (len(s) != len(t)) {
        return False;
    }
    import from collections { Counter }
    return (Counter(s) == Counter(t));
}

