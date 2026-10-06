"""
    Decode a Python version number encoded as a single integer into
    its human-readable string format.

    :param hex_version: int - The Python version number encoded as an integer.
    :return: str - The decoded version string in the format "MAJOR.MINOR.MICROLEVELSERIAL".
    """
def decode_python_version(hex_version: int) -> str {
    major = (hex_version >> 24) & 255;
    minor = (hex_version >> 16) & 255;
    micro = (hex_version >> 8) & 255;
    level_serial = hex_version & 255;
    level_indicator = (level_serial >> 4) & 15;
    serial = level_serial & 15;
    level_dict = {10: "a", 11: "b", 12: "rc", 15: ""};
    level = level_dict.get(level_indicator, "");
    if level {
        version_str = f"{major}.{minor}.{micro}{level}{serial}";
    } else {
        version_str = f"{major}.{minor}.{micro}";
    }
    return version_str;
}

