# parse_py_version

Parses a 32-bit integer encoded Python version and returns the version string.

>>> parse_py_version(0x030401a2) "3.4.1a2"
>>> parse_py_version(0x030702b3) "3.7.2b3"

Implement `parse_py_version(hex_version: int) -> str`.
