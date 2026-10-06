"""
    Filters a list of strings to include only those starting with the specified character.

    Parameters:
    strings (list of str): The list of strings to filter.
    char (str): The character to filter the strings by.

    Returns:
    list of str: A list of strings that start with the specified character.
    """
def filter_strings_starting_with(strings: list[str], char: str) -> list[str] {
    return [
        s
        for s in strings
        if s.startswith(char)
    ];
}

