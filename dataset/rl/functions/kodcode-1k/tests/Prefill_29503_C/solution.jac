"""
    Extracts and returns the highest numerical value from a given string.

    Parameters:
    s (str): Input string containing numerical values separated by spaces.

    Returns:
    int or float: The highest numerical value from the string.
    """
def highest_value_from_string(s: str) -> float {
    numbers = `list(map(float, s.split()));
    return max(numbers);
}

