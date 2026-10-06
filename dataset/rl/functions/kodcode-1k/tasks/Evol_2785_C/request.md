# character_count

Returns a dictionary where each key is a unique character from 
the input string, and the corresponding value is the count of 
occurrences of that character in the string.

>>> character_count("Programming")
{'P': 1, 'r': 2, 'o': 1, 'g': 2, 'a': 1, 'm': 2, 'i': 1, 'n': 1}
>>> character_count("")
{}

Implement `character_count(s: str) -> dict[str, int]`.
