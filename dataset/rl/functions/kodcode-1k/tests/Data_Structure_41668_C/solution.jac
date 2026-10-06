"""
    Reverses the order of words in the given sentence while handling
    leading, trailing, and multiple consecutive spaces appropriately.

    Parameters:
    sentence (str): The input sentence to be reversed.

    Returns:
    str: The sentence with the words' order reversed.
    """
def reverse_sentence(sentence: str) -> str {
    words = sentence.split();
    reversed_words = words[::-1];
    reversed_sentence = ' '.join(reversed_words);
    return reversed_sentence;
}

