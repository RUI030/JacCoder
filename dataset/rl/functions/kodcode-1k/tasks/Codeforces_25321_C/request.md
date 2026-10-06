# compress_string

Compress a string such that consecutive identical characters are replaced
by the character followed by the count of occurrences. Single occurrence does
not show the count.

Args:
s (str): Input string consisting of lowercase Latin letters

Returns:
str: Compressed string

Examples:
>>> compress_string("aaabbc")
'a3b2c'

>>> compress_string("abcd")
'abcd'

Implement `compress_string(s: str) -> str`.
