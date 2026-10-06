"""
    Parses a 32-bit integer encoded Python version and returns the version string.
    """
def parse_py_version(hex_version: int) -> str {
    major = (hex_version >> 24) & 255;
    minor = (hex_version >> 16) & 255;
    micro = (hex_version >> 8) & 255;
    release_level_code = (hex_version >> 4) & 15;
    release_serial = hex_version & 15;
    release_level_mapping = {10: 'a', 11: 'b', 12: 'rc', 15: ''};
    release_level = release_level_mapping.get(release_level_code, '');
    if (release_level_code == 15) {
        return f"{major}.{minor}.{micro}";
    } else {
        return f"{major}.{minor}.{micro}{release_level}{release_serial}";
    }
}

