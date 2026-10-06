"""
    Decodes a hexadecimal version number into its constituent components:
    major version, minor version, micro version, release level, and release serial.

    Args:
    hex_version (int): A 32-bit integer representing the encoded Python version

    Returns:
    dict: A dictionary with keys 'major', 'minor', 'micro', 'release_level', 'release_serial'
          and their corresponding integer values extracted from the input.
    """
def decode_python_version(hex_version: int) -> dict[str, int] {
    major = (hex_version >> 24) & 255;
    minor = (hex_version >> 16) & 255;
    micro = (hex_version >> 8) & 255;
    release_level = (hex_version >> 4) & 15;
    release_serial = hex_version & 15;
    return {
        'major': major,
        'minor': minor,
        'micro': micro,
        'release_level': release_level,
        'release_serial': release_serial
    };
}

