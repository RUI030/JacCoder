"""
    Extracts a list of unique words from the given sentence.

    Parameters:
    sentence (str): A sentence from which to extract unique words.

    Returns:
    list: A list of unique words sorted in the order they appear in the sentence.
    """
def extract_unique_words(sentence: str) -> list[str] {
    words = sentence.split();
    unique_words = [];
    seen_words = `set();
    for word in words {
        word = word.lower();
        if (word not in seen_words) {
            unique_words.append(word);
            seen_words.add(word);
        }
    }
    return unique_words;
}

