"""
    Switches the case of every letter in the text. Lowercase letters become uppercase,
    and uppercase letters become lowercase. Non-alphabet characters remain unchanged.

    Args:
    text (str): The input string.

    Returns:
    str: The string with the case of letters switched.
    """
def switch_case(text: str) -> str {
    return text.swapcase();
}

