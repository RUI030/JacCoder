"""
    Determine if the provided identifier is valid.

    Parameters:
    identifier (str): The identifier string to be evaluated.

    Returns:
    bool: True if the identifier is valid, otherwise False.
    """
def is_valid_identifier(identifier: str) -> bool {
    if not identifier {
        return False;
    }
    if not (identifier[0].isalpha() or (identifier[0] == '_')) {
        return False;
    }
    for char in identifier[1:] {
        if not (char.isalnum() or (char == '_')) {
            return False;
        }
    }
    return True;
}

