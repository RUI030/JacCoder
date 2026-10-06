"""
    Returns the first non-repeating character in the string s.
    If all characters are repeating or the string is empty, returns None.
    """
def first_non_repeating_char(s: str) -> str | None {
    import from collections { Counter }
    char_count = Counter(s);
    for char in s {
        if (char_count[char] == 1) {
            return char;
        }
    }
    return None;
}

