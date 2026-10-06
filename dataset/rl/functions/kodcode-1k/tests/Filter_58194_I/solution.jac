"""
    Converts a float or integer value to a percentage string with two decimal places.

    Parameters:
    value (float or int): The value to be converted.

    Returns:
    str: The formatted percentage string.
    """
def convert_to_percent(value: float) -> str {
    if (value > 1) {
        value = value / 100.0;
    }
    percent_value = value * 100;
    return f"{percent_value:.2f}%";
}

