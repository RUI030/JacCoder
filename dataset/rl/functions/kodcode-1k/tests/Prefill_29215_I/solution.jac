"""
    Returns a set of duplicate characters in the given string s.
    """
def find_duplicate_characters(s: str) -> set[str] {
    char_count = {};
    duplicates = `set();
    for char in s {
        if (char in char_count) {
            char_count[char] += 1;
            duplicates.add(char);
        } else {
            char_count[char] = 1;
        }
    }
    return duplicates;
}

