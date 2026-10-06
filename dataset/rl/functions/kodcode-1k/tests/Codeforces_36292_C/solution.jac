"""
    Returns the sentence with the order of the words reversed.
    """
def reverseWords(s: str) -> str {
    words = [
        word
        for word in s.split(' ')
        if word
    ];
    reversed_words = words[::-1];
    return ' '.join(reversed_words);
}

