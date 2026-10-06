# decode_python_version

Decode a Python version from an integer in PY_VERSION_HEX format.
>>> decode_python_version(0x030401a2) == "3.4.1a2"
>>> decode_python_version(0x030a00f0) == "3.10.0"

Implement `decode_python_version(version_hex: int) -> str`.
