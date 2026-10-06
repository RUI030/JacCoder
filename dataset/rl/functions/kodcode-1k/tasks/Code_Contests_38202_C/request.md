# binary_to_string

Emma needs to decode a binary string back into the
original string of characters. Write a program that
takes a binary string as input and outputs the original
string of characters. Each character in the original
string is represented by 8 bits in the binary string.

Args:
binary_str (str): A binary string of length divisible by 8.

Returns:
str: The original string of characters.

Examples:
>>> binary_to_string('0100100001100101011011000110110001101111')
'Hello'
>>> binary_to_string('0110100001101001')
'hi'

Implement `binary_to_string(binary_str: str) -> str`.
