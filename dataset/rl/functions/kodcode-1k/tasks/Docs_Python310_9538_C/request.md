# decode_python_version

Decodes a given Python version integer (PY_VERSION_HEX) and returns the human-readable version string.
>>> decode_python_version(0x030401a2) "3.4.1a2"
>>> decode_python_version(0x030a00f0) "3.10.0f0"

Implement `decode_python_version(version_hex: int) -> str`.
