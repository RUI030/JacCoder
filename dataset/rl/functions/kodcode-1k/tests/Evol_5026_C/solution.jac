"""
    Returns the first non-repeating character in the string s.
    If all characters are repeating or the string is empty, returns an underscore.
    The function is case-sensitive.
    """
def first_non_repeating_character(s: str) -> str {
    char_count = {};
    for char in s {
        if (char in char_count) {
            char_count[char] += 1;
        } else {
            char_count[char] = 1;
        }
    }
    for char in s {
        if (char_count[char] == 1) {
            return char;
        }
    }
    return '_';
}

