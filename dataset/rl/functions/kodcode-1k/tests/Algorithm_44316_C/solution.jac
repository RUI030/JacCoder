import re;
"""
    Determine if two strings are anagrams of each other, ignoring spaces,
    punctuation, and case mismatches.
    """
def are_anagrams(string1: str, string2: str) -> bool {
    filtered_string1 = re.sub(r'[^A-Za-z]', '', string1).lower();
    filtered_string2 = re.sub(r'[^A-Za-z]', '', string2).lower();
    return (sorted(filtered_string1) == sorted(filtered_string2));
}

