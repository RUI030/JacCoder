"""
    Decodes the provided version_hex (in PY_VERSION_HEX format) into a human-readable Python version string.
    """
def decode_python_version(version_hex: int) -> str {
    major = (version_hex >> 24) & 255;
    minor = (version_hex >> 16) & 255;
    micro = (version_hex >> 8) & 255;
    release_level = (version_hex >> 4) & 15;
    release_serial = version_hex & 15;
    release_levels = {10: 'a', 11: 'b', 12: 'c', 15: ''};
    version_str = f"{major}.{minor}.{micro}";
    if (release_level != 15) {
        version_str += f"{release_levels[release_level]}{release_serial}";
    }
    return version_str;
}

