# extract_unique_words

Extracts unique words from the given text, ignoring punctuation and case sensitivity.

Parameters:
    text (str): The input string from which to extract unique words.

Returns:
    list: A sorted list of unique words.

>>> extract_unique_words("") == []
>>> extract_unique_words("Hello") == ["hello"]

Implement `extract_unique_words(text: str) -> list[str]`.
