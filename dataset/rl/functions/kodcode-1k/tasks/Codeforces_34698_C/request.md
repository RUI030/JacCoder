# convert_ascii

Takes a list of integers and converts valid ASCII values to a string.
Characters in the ASCII range of 32 to 126 inclusive are considered valid.

>>> convert_ascii([72, 101, 108, 108, 111, 33]) 
"Hello!"
>>> convert_ascii([72, 101, 108, 108, 111, 33, 200]) 
"Hello!"

Implement `convert_ascii(int_list: list[int]) -> str`.
