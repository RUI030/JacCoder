"""
    Capitalizes the first letter of each word in the given sentence.

    :param sentence: A string containing one or more words separated by spaces.
    :return: A string where the first letter of each word is capitalized.
    """
def capitalize_first_letter(sentence: str) -> str {
    words = sentence.split();
    capitalized_words = [word.capitalize() for word in words];
    capitalized_sentence = ' '.join(capitalized_words);
    return capitalized_sentence;
}

