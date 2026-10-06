# decode_python_version

Decodes a hexadecimal integer representing the Python version and returns
the version information as a string.

>>> decode_python_version(0x030401a2)
'3.4.1a2'

>>> decode_python_version(0x030a00f0)
'3.10.0'

Implement `decode_python_version(hex_version: int) -> str`.
