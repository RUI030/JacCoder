import from collections { Counter }
"""
    Returns the sum of the lengths of all "good" strings in the array `words`.

    A string is considered "good" if it can be formed by characters from `chars`
    (each character can only be used once in `chars`).

    Parameters:
    words (list of str): The list of words to check.
    chars (str): The string containing available characters.

    Returns:
    int: The sum of the lengths of all good strings.
    """
def count_good_strings(words: list[str], chars: str) -> int {
    chars_count = Counter(chars);
    total_length = 0;
    for word in words {
        word_count = Counter(word);
        if all((word_count[char] <= chars_count[char]) for char in word_count) {
            total_length += len(word);
        }
    }
    return total_length;
}

