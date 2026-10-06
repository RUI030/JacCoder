"""
    Converts each character in the input string to its corresponding ASCII value
    and returns a list of these values.

    Parameters:
    input_string (str): The string to convert.

    Returns:
    list: A list of integers representing the ASCII values of the characters in the input string.
    """
def string_to_ascii_values(input_string: str) -> list[int] {
    return [ord(char) for char in input_string];
}

