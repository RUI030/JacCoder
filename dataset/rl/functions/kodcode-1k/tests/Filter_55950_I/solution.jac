"""
    Returns a set of all unique trigrams (3-letter substrings) from the input string.
    Each trigram consists of consecutive characters from the input string.
    """
def find_trigrams(input_string: str) -> set[str] {
    if (len(input_string) < 3) {
        return `set();
    }
    trigrams = {input_string[i:(i + 3)] for i in range((len(input_string) - 2))};
    return trigrams;
}

