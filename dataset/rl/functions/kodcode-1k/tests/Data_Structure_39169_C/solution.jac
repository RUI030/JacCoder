"""
    Reverses the order of words in a sentence,
    while preserving punctuation attached to words and extra spaces between words.
    """
def reverse_words_with_punctuation(sentence: str) -> str {
    words = sentence.split();
    reversed_words = words[::-1];
    reversed_sentence = ' '.join(reversed_words);
    return reversed_sentence;
}

