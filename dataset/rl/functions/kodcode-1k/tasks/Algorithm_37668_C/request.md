# string_interleave

Merges two strings by alternating their characters. If one string is longer
than the other, append the remaining characters of the longer string at 
the end of the result.

Args:
s1 (str): The first input string.
s2 (str): The second input string.

Returns:
str: The interleaved result of s1 and s2.

Example:
>>> string_interleave("abc", "123")
'a1b2c3'
>>> string_interleave("ab", "123")
'a1b23'

Implement `string_interleave(s1: str, s2: str) -> str`.
