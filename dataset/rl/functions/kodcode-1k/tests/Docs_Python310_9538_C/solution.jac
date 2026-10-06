"""
    Decodes a given Python version integer (PY_VERSION_HEX) and returns the human-readable version string.
    """
def decode_python_version(version_hex: int) -> str {
    major = (version_hex >> 24) & 255;
    minor = (version_hex >> 16) & 255;
    micro = (version_hex >> 8) & 255;
    level_code = (version_hex >> 4) & 15;
    serial = version_hex & 15;
    level_map = {10: 'a', 11: 'b', 12: 'c', 15: 'f'};
    level = level_map.get(level_code, 'f');
    return f"{major}.{minor}.{micro}{level}{serial}";
}

