# is_match

Determines if a given pattern string matches the specified target string.
The pattern string may include '?' (matches exactly one character) and '*'
(matches zero or more characters).

Parameters:
target (str): The target string.
pattern (str): The pattern string.

Returns:
bool: True if the pattern matches the target, False otherwise.

Examples:
>>> is_match("abcdef", "a?c*e")
True
>>> is_match("abc", "a*c?d")
False

Implement `is_match(target: str, pattern: str) -> bool`.
