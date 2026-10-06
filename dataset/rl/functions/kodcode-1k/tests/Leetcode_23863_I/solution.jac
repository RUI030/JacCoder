"""
    Returns the longest word that can be built one character at a time by other words in the list.
    If there is more than one possible longest word, returns the lexicographically smallest one.
    """
def longest_word(words: list[str]) -> str {
    words_set = `set(words);
    longest_word = "";
    for word in words {
        if (
            (len(word) > len(longest_word))
            or ((len(word) == len(longest_word)) and (word < longest_word))
        ) {
            if all((word[:k] in words_set) for k in range(1, len(word))) {
                longest_word = word;
            }
        }
    }
    return longest_word;
}

