"""
    Returns a new string where each character in the original string is repeated once.
    """
def repeat_characters(s: str) -> str {
    result = "";
    for char in s {
        result += char * 2;
    }
    return result;
}

