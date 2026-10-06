"""
    Reverses the characters of each word in a string.

    :param sentence: A string with words to reverse.
    :return: A new string with each word's characters reversed.
    """
def reverse_words(sentence: str) -> str {
    return ' '.join(word[::-1] for word in sentence.split());
}

