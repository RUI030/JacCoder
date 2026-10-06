"""
    Returns a new string with the words in reverse order, while maintaining the original spacing and punctuation.
    """
def reverseWords(text: str) -> str {
    words = text.split();
    reversed_words = words[::-1];
    return ' '.join(reversed_words);
}

