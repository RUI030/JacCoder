# manipulate_bytearrays

Concatenates the bytearray equivalent of `str1` and `str2`,
resizes the resulting bytearray to the size of `str1`, and 
returns the string representation of the modified bytearray.

Args:
str1 (str): The first input string.
str2 (str): The second input string.

Returns:
str: The resultant string after performing the specified operations on the bytearrays derived from `str1` and `str2`.

>>> manipulate_bytearrays("Hello", "World") == "HelloWo"
>>> manipulate_bytearrays("Python", "310") == "Python31"

Implement `manipulate_bytearrays(str1: str, str2: str) -> str`.
