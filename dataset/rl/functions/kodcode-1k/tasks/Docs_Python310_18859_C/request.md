# process_bytearrays

Concatenates bytearrays of specified lengths and resizes to the final length.

Parameters:
- string_length_pairs (List[Tuple[str, int]]): List of tuples containing a string and its length.
- final_length (int): The desired length of the resulting bytearray.

Returns:
- str: String representation of the resized bytearray.

>>> process_bytearrays([("abc", 3), ("defg", 4), ("hij", 3)], 8)
'abcdefgh'
>>> process_bytearrays([("abc", 3), ("defg", 4), ("hij", 3)], 12)
'abcdefghij\x00\x00'

Implement `process_bytearrays(string_length_pairs: list[tuple[str, int]], final_length: int) -> str`.
