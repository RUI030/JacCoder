"""
    Returns the first non-repeated character in the string.
    If all characters are repeated, returns an underscore.
    """
def first_non_repeated_character(text: str) -> str {
    character_count = {};
    for char in text {
        if (char in character_count) {
            character_count[char] += 1;
        } else {
            character_count[char] = 1;
        }
    }
    for char in text {
        if (character_count[char] == 1) {
            return char;
        }
    }
    return '_';
}

