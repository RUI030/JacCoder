import from collections { Counter }
"""
    Returns True if s1 is an anagram of s2, otherwise False.
    """
def check_anagram(s1: str, s2: str) -> bool {
    if (len(s1) != len(s2)) {
        return False;
    }
    return (Counter(s1) == Counter(s2));
}

