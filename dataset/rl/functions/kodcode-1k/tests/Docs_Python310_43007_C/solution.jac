"""
    Decodes a hexadecimal integer representing the Python version and returns
    the version information as a string.
    """
def decode_python_version(hex_version: int) -> str {
    major = (hex_version >> 24) & 255;
    minor = (hex_version >> 16) & 255;
    micro = (hex_version >> 8) & 255;
    level_num = (hex_version >> 4) & 15;
    serial = hex_version & 15;
    level_dict = {10: 'a', 11: 'b', 12: 'rc', 15: ''};
    level = level_dict.get(level_num, '');
    if level {
        version_str = f"{major}.{minor}.{micro}{level}{serial}";
    } else {
        version_str = f"{major}.{minor}.{micro}";
    }
    return version_str;
}

