"""
    Finds the index of the first non-repeating character in the given string.

    Parameters:
    s (str): The input string consisting of lowercase English letters.

    Returns:
    int: Index of the first non-repeating character. If there is no such character, return -1.
    """
def first_unique_char_optimized(s: str) -> int {
    char_count = {};
    for char in s {
        if (char in char_count) {
            char_count[char] += 1;
        } else {
            char_count[char] = 1;
        }
    }
    for (index, char) in enumerate(s) {
        if (char_count[char] == 1) {
            return index;
        }
    }
    return -1;
}

