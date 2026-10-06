"""
    Reverses each word in the string s while preserving spaces and original word order.
    """
def reverse_each_word(s: str) -> str {
    words = s.split(' ');
    reversed_words = [word[::-1] for word in words];
    return ' '.join(reversed_words);
}

