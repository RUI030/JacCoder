import re;
"""
    Convert the provided string to snake_case.

    Parameters:
    s (str): The string to be converted to snake_case.

    Returns:
    str: The string in snake_case.
    """
def to_snake_case(s: str) -> str {
    s = s.strip();
    s = re.sub(r'[\s]+', '_', s);
    s = re.sub(r'[^a-zA-Z0-9_]', '', s);
    return s.lower();
}

