"""
    Determine if the string s follows the pattern.

    Args:
    pattern (str): a string pattern.
    s (str): a string consisting of words separated by spaces.

    Returns:
    bool: True if s follows the pattern, False otherwise.
    """
def wordPattern(pattern: str, s: str) -> bool {
    words = s.split();
    if (len(pattern) != len(words)) {
        return False;
    }
    char_to_word = {};
    word_to_char = {};
    for (char, word) in zip(pattern, words) {
        if (char in char_to_word) {
            if (char_to_word[char] != word) {
                return False;
            }
        } else {
            char_to_word[char] = word;
        }
        if (word in word_to_char) {
            if (word_to_char[word] != char) {
                return False;
            }
        } else {
            word_to_char[word] = char;
        }
    }
    return True;
}

