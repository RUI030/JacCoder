"""
    Returns a new string with all characters shifted one position to the right.
    The last character moves to the first position.
    """
def shift_string_right(input_string: str) -> str {
    if not input_string {
        return input_string;
    }
    return (input_string[-1] + input_string[:-1]);
}

