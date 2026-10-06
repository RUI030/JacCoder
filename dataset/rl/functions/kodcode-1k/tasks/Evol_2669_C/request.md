# character_count

Returns a dictionary where keys are the characters in the string,
and values are the count of each character's occurrences. The counting is case insensitive.
>>> character_count("Programming")
{'p': 1, 'r': 2, 'o': 1, 'g': 2, 'a': 1, 'm': 2, 'i': 1, 'n': 1}
>>> character_count("AaBb")
{'a': 2, 'b': 2}

Implement `character_count(s: str) -> dict[str, int]`.
