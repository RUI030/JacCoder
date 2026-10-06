# decode_python_version

Decode the CPython version from a 32-bit hexadecimal version number.
>>> decode_python_version(0x030401a2) "3.4.1a2"
>>> decode_python_version(0x030a00f0) "3.10.0"

Implement `decode_python_version(hexversion: int) -> str`.
