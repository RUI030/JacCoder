"""
    Converts a given string into a list of ASCII values.

    :param s: input string
    :return: list of ASCII values corresponding to characters in the string
    """
def string_to_ascii_list(s: str) -> list[int] {
    return [ord(char) for char in s];
}

