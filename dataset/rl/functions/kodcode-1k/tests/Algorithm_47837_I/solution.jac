"""
    Capitalizes the first letter of each word in the given string `sentence`
    and ensures there is exactly one space between each word.
    """
def reformat_sentence(sentence: str) -> str {
    words = sentence.split();
    capitalized_words = [word.capitalize() for word in words];
    return ' '.join(capitalized_words);
}

