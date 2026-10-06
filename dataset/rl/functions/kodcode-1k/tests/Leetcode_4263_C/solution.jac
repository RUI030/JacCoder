"""
    Returns the minimum length of the text after removing all possible words from the words array.
    """
def min_length_after_removals(text: str, words: list[str]) -> int {
    while True {
        initial_length = len(text);
        for word in words {
            if (word in text) {
                text = text.replace(word, "");
            }
        }
        if (len(text) == initial_length) {
            break;
        }
    }
    return len(text);
}

