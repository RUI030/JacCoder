import re;
"""
    Converts a string into a list of words.
    The function handles punctuation and treats words separated by
    commas, spaces, or new lines as individual words in the list.

    Args:
    s (str): Input string.

    Returns:
    list: List of words.
    """
def string_to_word_list(s: str) -> list[str] {
    words = re.split(r'\W+', s);
    return [
        word
        for word in words
        if word
    ];
}

