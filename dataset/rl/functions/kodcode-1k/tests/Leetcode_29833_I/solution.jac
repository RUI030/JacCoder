"""
    Rearranges the words in the sentence such that all words are sorted in increasing order of their lengths.
    If two words have the same length, they appear in the order they were found in the original sentence.

    :param sentence: str, a sentence where words are separated by spaces
    :return: str, a sentence with words sorted by length
    """
def rearrange_sentence(sentence: str) -> str {
    words = sentence.split();
    sorted_words = sorted(words, key=len);
    return ' '.join(sorted_words);
}

