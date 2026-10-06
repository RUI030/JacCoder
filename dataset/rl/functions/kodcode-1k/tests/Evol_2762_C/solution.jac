"""
    Takes a string containing a series of space-separated words and returns a new string
    where the order of the words is reversed.

    Args:
    sentence (str): Input string containing space-separated words

    Returns:
    str: String with words in reversed order
    """
def reverse_words(sentence: str) -> str {
    words = sentence.split();
    reversed_words = ' '.join(reversed(words));
    return reversed_words;
}

