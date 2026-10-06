"""
    Returns "YES" if str1 can be rearranged to form str2, otherwise returns "NO".
    """
def are_anagrams(str1: str, str2: str) -> str {
    import from collections { Counter }
    if (len(str1) != len(str2)) {
        return "NO";
    }
    return "YES" if (Counter(str1) == Counter(str2)) else "NO";
}

