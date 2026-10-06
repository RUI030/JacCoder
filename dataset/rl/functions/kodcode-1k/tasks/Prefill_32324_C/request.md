# string_to_word_list

Converts a string into a list of words.
    The function handles punctuation and treats words separated by
    commas, spaces, or new lines as individual words in the list.

    Args:
    s (str): Input string.

    Returns:
    list: List of words.

    >>> string_to_word_list("Hello world")
    ['Hello', 'world']
    >>> string_to_word_list("Hello, world!")
    ['Hello', 'world']

Implement `string_to_word_list(s: str) -> list[str]`.
