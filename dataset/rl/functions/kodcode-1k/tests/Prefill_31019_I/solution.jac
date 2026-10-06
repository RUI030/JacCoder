"""
    Counts the occurrences of each character in the string and
    returns the result as a dictionary. Ignores case sensitivity.

    Parameters:
    s (str): The string to count characters in

    Returns:
    dict: A dictionary with characters as keys and their
          counts as values
    """
def count_characters(s: str) -> dict[str, int] {
    s = s.lower();
    character_count = {};
    for char in s {
        if (char in character_count) {
            character_count[char] += 1;
        } else {
            character_count[char] = 1;
        }
    }
    return character_count;
}

