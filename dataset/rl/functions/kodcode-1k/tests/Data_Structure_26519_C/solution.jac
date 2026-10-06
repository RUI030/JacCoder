"""
    Returns the reversed version of the input string `s`.
    """
def advanced_reverse(s: str) -> str {
    result = [];
    for char in s {
        result.insert(0, char);
    }
    return ''.join(result);
}

