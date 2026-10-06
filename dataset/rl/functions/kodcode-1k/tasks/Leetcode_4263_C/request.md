# min_length_after_removals

Returns the minimum length of the text after removing all possible words from the words array.

Parameters:
    text (str): The original string from which substrings will be removed.
    words (list): A list of substrings to be removed from the text.

Returns:
    int: The minimum length of the text after all removals.

Example:
    >>> min_length_after_removals("abcde", ["ab", "cd"])
    1
    >>> min_length_after_removals("abcde", ["fg", "hi"])
    5

Implement `min_length_after_removals(text: str, words: list[str]) -> int`.
