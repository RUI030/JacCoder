import re;
"""
    Replaces all sequences of digits in the input string with the specified replacement string.

    Parameters:
        input_string (str): The input string containing letters, digits, and possibly special characters.
        replacement (str): The string to replace each sequence of digits.

    Returns:
        str: A new string with all sequences of digits replaced by the replacement string.
    """
def replace_digits(input_string: str, replacement: str) -> str {
    return re.sub(r'\d+', replacement, input_string);
}

