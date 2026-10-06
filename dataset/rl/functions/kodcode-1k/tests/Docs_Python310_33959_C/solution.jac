"""
    Decodes a hexadecimal version number into its respective version components.

    Args:
    hex_version (int): A 32-bit integer representing the encoded version number.

    Returns:
    str: The version components formatted as "X.Y.ZlevelN".
    """
def decode_version(hex_version: int) -> str {
    X = (hex_version >> 24) & 255;
    Y = (hex_version >> 16) & 255;
    Z = (hex_version >> 8) & 255;
    level = (hex_version >> 4) & 15;
    N = hex_version & 15;
    level_map = {10: 'a', 11: 'b', 12: 'rc', 15: ''};
    level_str = level_map.get(level, '');
    if level_str {
        version = f"{X}.{Y}.{Z}{level_str}{N}";
    } else {
        version = f"{X}.{Y}.{Z}";
    }
    return version;
}

