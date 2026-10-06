"""
    Returns a string with the order of words reversed.

    Args:
    sentence: A string representing the input sentence.

    Returns:
    A string with the words in reverse order.
    """
def reverse_words(sentence: str) -> str {
    words = sentence.split();
    reversed_words = words[::-1];
    return ' '.join(reversed_words);
}

