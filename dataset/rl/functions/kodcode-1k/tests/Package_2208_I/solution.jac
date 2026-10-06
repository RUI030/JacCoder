"""
    Reverses the words in a string but keeps the characters within each word in the same order.
    Ensures that multiple spaces between words are reduced to a single space.

    Parameters:
    s (str): The input string

    Returns:
    str: The string with words in reverse order and characters within each word unchanged.
    """
def reverse_words(s: str) -> str {
    words = s.split();
    reversed_words = words[::-1];
    return ' '.join(reversed_words);
}

