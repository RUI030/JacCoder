# decode_version

Decodes a hexadecimal version number into its respective version components.

Args:
hex_version (int): A 32-bit integer representing the encoded version number.

Returns:
str: The version components formatted as "X.Y.ZlevelN".

Examples:
>>> decode_version(0x030401a2)
'3.4.1a2'
>>> decode_version(0x030a00f0)
'3.10.0'

Implement `decode_version(hex_version: int) -> str`.
