import from collections { Counter }
"""
    Returns the most frequently occurring word from the list of strings.
    If there is a tie, returns the word that comes first in alphabetical order.
    """
def most_common_word(word_list: list[str]) -> str {
    if not word_list {
        return "";
    }
    word_counter = Counter(word_list);
    max_frequency = max(word_counter.values());
    most_common_words = [
        word
        for (word, count) in word_counter.items()
        if (count == max_frequency)
    ];
    most_common_words.sort();
    return most_common_words[0];
}

