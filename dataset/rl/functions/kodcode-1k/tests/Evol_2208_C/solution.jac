import re;
"""
    Validates each string in the color_list to check if it is a proper hexadecimal color code.
    Returns a list of tuples with the original string and a boolean indicating its validity.
    """
def validate_hex_colors(color_list: list[str]) -> list[tuple[str, bool]] {
    result = [];
    hex_color_pattern = re.compile(r'^#(?:[0-9a-fA-F]{3}){1,2}$');
    for color in color_list {
        if hex_color_pattern.match(color) {
            result.append((color, True));
        } else {
            result.append((color, False));
        }
    }
    return result;
}

