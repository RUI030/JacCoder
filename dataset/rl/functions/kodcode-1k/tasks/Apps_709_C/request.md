# is_valid_pattern

Checks if the string follows the given pattern. Each character in the pattern
maps to a distinct word in the string.

:param pattern: A string of alphabetic characters representing the pattern.
:param string: A string of words separated by spaces to be checked against the pattern.
:return: True if the string follows the pattern, False otherwise.

>>> is_valid_pattern("abba", "dog cat cat dog")
True
>>> is_valid_pattern("abba", "dog cat cat fish")
False

Implement `is_valid_pattern(pattern: str, string: str) -> bool`.
