"""
    Takes a list of strings and returns a dictionary where each key is a
    unique string from the list and the value is the length of that string.
    """
def strings_to_length_dict(strings: list[str]) -> dict[str, int] {
    return {string: len(string) for string in `set(strings)};
}

