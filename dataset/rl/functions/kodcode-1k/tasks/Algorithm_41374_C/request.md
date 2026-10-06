# words_starting_with

Returns a list of words from the original list that start with the given target character.
The function is case-insensitive.

>>> words_starting_with(["Apple", "banana", "Avocado", "cherry", "Apricot"], 'a')
['Apple', 'Avocado', 'Apricot']

>>> words_starting_with(["Dog", "cat", "Dolphin", "elephant", "duck"], 'D')
['Dog', 'Dolphin', 'duck']

Implement `words_starting_with(words: list[str], target: str) -> list[str]`.
