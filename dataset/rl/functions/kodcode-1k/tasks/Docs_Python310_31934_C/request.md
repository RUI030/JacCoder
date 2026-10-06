# decode_python_version

Decode a Python version number encoded as a single integer into 
its human-readable string format.

:param hex_version: int - The Python version number encoded as an integer.
:return: str - The decoded version string in the format "MAJOR.MINOR.MICROLEVELSERIAL".

>>> decode_python_version(0x030401a2) == "3.4.1a2"
>>> decode_python_version(0x030a00f0) == "3.10.0"

Implement `decode_python_version(hex_version: int) -> str`.
