# regex_matcher

Determine if the given string matches the regular expression pattern.

Args:
pattern (str): A non-empty string representing the regular expression pattern.
string (str): A non-empty string that needs to be checked against the pattern.

Returns:
bool: True if the string matches the pattern, otherwise False.

>>> regex_matcher(r'^[a-zA-Z0-9_]+$', 'Valid_123')
True
>>> regex_matcher(r'^[a-zA-Z0-9_]+$', 'Invalid-123')
False

Implement `regex_matcher(pattern: str, string: str) -> bool`.
