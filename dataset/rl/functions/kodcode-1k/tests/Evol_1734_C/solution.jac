"""
    Takes a list of strings and returns a dictionary with each string as a key
    and the length of that string as the value.
    """
def string_lengths(strings: list[str]) -> dict[str, int] {
    result = {};
    for string in strings {
        result[string] = len(string);
    }
    return result;
}

