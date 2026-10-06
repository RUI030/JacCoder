"""
    Determines if str1 is a permutation of str2.

    Both strings are case-sensitive and can contain spaces.
    """
def arePermutations(str1: str, str2: str) -> bool {
    if (len(str1) != len(str2)) {
        return False;
    }
    return (sorted(str1) == sorted(str2));
}

