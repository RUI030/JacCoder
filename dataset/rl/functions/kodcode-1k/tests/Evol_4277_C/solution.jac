"""
    Reverses each word in a given sentence while preserving the order of the words.

    :param sentence: A string representing the input sentence.
    :return: A string with each word reversed while maintaining word order.
    """
def reverse_words(sentence: str) -> str {
    words = sentence.split();
    reversed_words = [''.join(reversed(word)) for word in words];
    return ' '.join(reversed_words);
}

