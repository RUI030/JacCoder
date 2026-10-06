# find_rotation_index

Determines the index by which a string has been rotated.

Parameters:
original (str): The original string.
rotated (str): The rotated version of the original string.

Returns:
int: The number of characters that have been moved from the beginning of the original string
     to the end to form the rotated string. Returns -1 if the rotated string is not a valid
     rotation of the original string.

>>> find_rotation_index("abcde", "cdeab")
2
>>> find_rotation_index("hello", "lohel")
3

Implement `find_rotation_index(original: str, rotated: str) -> int`.
