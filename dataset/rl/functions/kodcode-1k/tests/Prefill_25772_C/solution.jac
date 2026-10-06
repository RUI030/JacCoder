import re;
"""
    Extracts unique words from the given text, ignoring punctuation and case sensitivity.

    Parameters:
        text (str): The input string from which to extract unique words.

    Returns:
        list: A sorted list of unique words.
    """
def extract_unique_words(text: str) -> list[str] {
    words = re.findall(r'\b\w+\b', text.lower());
    unique_words = `set(words);
    return sorted(unique_words);
}

