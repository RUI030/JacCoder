# decode_python_version

Decodes a hexadecimal version number into its constituent components:
major version, minor version, micro version, release level, and release serial.

Args:
hex_version (int): A 32-bit integer representing the encoded Python version

Returns:
dict: A dictionary with keys 'major', 'minor', 'micro', 'release_level', 'release_serial'
      and their corresponding integer values extracted from the input.

Example:
- `decode_python_version(50594210) == {'major': 3, 'minor': 4, 'micro': 1, 'release_level': 10, 'release_serial': 2}`

Implement `decode_python_version(hex_version: int) -> dict[str, int]`.
