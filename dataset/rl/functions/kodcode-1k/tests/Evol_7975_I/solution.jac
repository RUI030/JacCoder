"""
    Returns True if str1 is an anagram of str2, False otherwise.
    Ignores case and spaces.
    """
def is_anagram(str1: str, str2: str) -> bool {
    clean_str1 = ''.join(str1.lower().split());
    clean_str2 = ''.join(str2.lower().split());
    return (sorted(clean_str1) == sorted(clean_str2));
}

