"""
    Given a sentence ending with a full stop, return the sentence followed by the last word repeated twice.
    """
def parrot_repeats(sentence: str) -> str {
    clean_sentence = sentence[:-1];
    words = clean_sentence.split();
    last_word = words[-1];
    return f"{clean_sentence}. {last_word} {last_word}";
}

