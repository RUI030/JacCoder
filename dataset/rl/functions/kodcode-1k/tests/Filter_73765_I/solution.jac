import re;
"""
    Returns the number of unique words in the sentence.
    Words are compared in a case-insensitive manner and punctuation marks are ignored.
    """
def count_unique_words(sentence: str) -> int {
    words = re.findall(r'\b\w+\b', sentence.lower());
    unique_words = `set(words);
    return len(unique_words);
}

