"""
    Concatenates numbers in the given string and returns the integer representation of the result.

    Parameters:
    s (str): a string of digits and spaces representing the numbers.

    Returns:
    int: the concatenated sum as described.
    """
def concatenated_sum(s: str) -> int {
    numbers = s.split();
    concatenated_string = ''.join(numbers);
    return int(concatenated_string);
}

