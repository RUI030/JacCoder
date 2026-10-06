import from collections { Counter }
"""
    Returns True if s1 and s2 are anagrams of each other, False otherwise.
    """
def generalized_anagram(s1: str, s2: str) -> bool {
    if (len(s1) != len(s2)) {
        return False;
    }
    return (Counter(s1) == Counter(s2));
}

