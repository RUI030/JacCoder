# replace_digits

Replaces all sequences of digits in the input string with the specified replacement string.

Parameters:
    input_string (str): The input string containing letters, digits, and possibly special characters.
    replacement (str): The string to replace each sequence of digits.

Returns:
    str: A new string with all sequences of digits replaced by the replacement string.

Examples:
>>> replace_digits("The 1 quick brown fox jumps over 13 lazy dogs.", "X")
'The X quick brown fox jumps over X lazy dogs.'

>>> replace_digits("abc123def456ghi789", "#")
'abc#def#ghi#'

Implement `replace_digits(input_string: str, replacement: str) -> str`.
