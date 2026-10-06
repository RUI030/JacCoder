"""
    Reverses the order of characters in every word in the input string
    while keeping the words in the original order.
    """
def reverse_words_in_string(s: str) -> str {
    words = s.split();
    reversed_words = [word[::-1] for word in words];
    return ' '.join(reversed_words);
}

