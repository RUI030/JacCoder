# parse_python_version

Parses a 32-bit integer representing a Python version in big-endian order.

:param hex_version: A 32-bit integer representing the Python version in big-endian order.
:return: A string in the format "X.Y.ZaN" where:
         - X is the major version.
         - Y is the minor version.
         - Z is the micro version.
         - a represents alpha (A), b represents beta (B), c represents release candidate (C), and nothing for final (F).
         - N is the release serial number, omitted for final releases.

Example:
- `parse_python_version(50594210) == '3.4.1a2'`

Implement `parse_python_version(hex_version: int) -> str`.
