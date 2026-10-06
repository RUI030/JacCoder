"""
    Returns the word with the highest number of unique characters from the input string.

    :param s: A string of words separated by spaces.
    :return: The word with the highest number of unique characters.
    """
def word_with_most_unique_chars(s: str) -> str {
    words = s.split();
    max_unique_count = 0;
    result_word = "";
    for word in words {
        unique_count = len(`set(word));
        if (unique_count > max_unique_count) {
            max_unique_count = unique_count;
            result_word = word;
        }
    }
    return result_word;
}

