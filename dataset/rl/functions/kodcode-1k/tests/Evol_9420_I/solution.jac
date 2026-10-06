"""
    Takes a list of strings as input and returns a dictionary with keys as the lengths
    of the strings and values as lists of strings that correspond to those lengths.

    :param strings: List of strings
    :return: Dictionary with keys as string lengths and values as lists of strings
    """
def group_strings_by_length(strings: list[str]) -> dict[int, list[str]] {
    length_dict = {};
    for string in strings {
        length = len(string);
        if (length not in length_dict) {
            length_dict[length] = [];
        }
        length_dict[length].append(string);
    }
    return length_dict;
}

