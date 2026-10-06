"""
    Checks if the string follows the given pattern. Each character in the pattern
    maps to a distinct word in the string.

    :param pattern: A string of alphabetic characters representing the pattern.
    :param string: A string of words separated by spaces to be checked against the pattern.
    :return: True if the string follows the pattern, False otherwise.
    """
def is_valid_pattern(pattern: str, string: str) -> bool {
    pattern_to_word = {};
    word_to_pattern = {};
    words = string.split();
    if (len(pattern) != len(words)) {
        return False;
    }
    for (char, word) in zip(pattern, words) {
        if (char in pattern_to_word) {
            if (pattern_to_word[char] != word) {
                return False;
            }
        } else {
            if (word in word_to_pattern) {
                return False;
            }
            pattern_to_word[char] = word;
            word_to_pattern[word] = char;
        }
    }
    return True;
}

