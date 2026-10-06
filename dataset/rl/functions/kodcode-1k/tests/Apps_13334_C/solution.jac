"""
    Reverses the characters in each word of the sentence, but keeps the order of words.

    Parameters:
    sentence (str): The input sentence.

    Returns:
    str: The transformed sentence with characters in each word reversed.
    """
def reverse_words_in_sentence(sentence: str) -> str {
    words = sentence.split();
    reversed_words = [''.join(reversed(word)) for word in words];
    return ' '.join(reversed_words);
}

