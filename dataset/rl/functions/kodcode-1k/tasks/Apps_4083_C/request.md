# is_valid_hexadecimal

Checks if the given string is a valid hexadecimal number.

A valid hexadecimal number can be prefixed with "0x" or "0X" (case insensitive),
and must consist of digits [0-9] and letters [a-f] or [A-F].

Parameters:
s (str): The string to check.

Returns:
bool: True if the string is a valid hexadecimal number, False otherwise.

Examples:
>>> is_valid_hexadecimal("0x1A3F")
True

>>> is_valid_hexadecimal("1A3G")
False

Implement `is_valid_hexadecimal(s: str) -> bool`.
