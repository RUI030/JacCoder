"""
    Reverses the order of words in the given sentence while preserving the original spacing.

    Args:
    sentence (str): The sentence consisting of words and punctuations.

    Returns:
    str: The sentence with words in reverse order.
    """
def reverse_words(sentence: str) -> str {
    words = sentence.split(' ');
    reversed_words = ' '.join(reversed(words));
    return reversed_words;
}

