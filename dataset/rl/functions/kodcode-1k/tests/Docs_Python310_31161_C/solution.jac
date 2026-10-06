"""
    Parses a 32-bit integer representing a Python version in big-endian order.

    :param hex_version: A 32-bit integer representing the Python version in big-endian order.
    :return: A string in the format "X.Y.ZaN" where:
             - X is the major version.
             - Y is the minor version.
             - Z is the micro version.
             - a represents alpha (A), b represents beta (B), c represents release candidate (C), and nothing for final (F).
             - N is the release serial number, omitted for final releases.
    """
def parse_python_version(hex_version: int) -> str {
    major = (hex_version >> 24) & 255;
    minor = (hex_version >> 16) & 255;
    micro = (hex_version >> 8) & 255;
    release = (hex_version >> 4) & 15;
    serial = hex_version & 15;
    release_level = {10: 'a', 11: 'b', 12: 'c', 15: ''};
    version_str = f"{major}.{minor}.{micro}";
    if (release in release_level) {
        version_str += release_level[release];
        if (release != 15) {
            version_str += str(serial);
        }
    }
    return version_str;
}

