# char_frequency

Returns a dictionary mapping each unique character to its frequency in the
string 's'. The function is case-insensitive.

Parameters:
s (str): The input string

Returns:
dict: A dictionary with characters as keys and their frequencies as values

Examples:
>>> char_frequency("HelloWorld")
{'h': 1, 'e': 1, 'l': 3, 'o': 2, 'w': 1, 'r': 1, 'd': 1}
>>> char_frequency("Programming")
{'p': 1, 'r': 2, 'o': 1, 'g': 2, 'a': 1, 'm': 2, 'i': 1, 'n': 1}

Implement `char_frequency(s: str) -> dict[str, int]`.
