import re;
"""
    Removes all characters from the input string except for alphanumeric characters and spaces.

    Args:
    input_str (str): The string to be cleaned.

    Returns:
    str: The cleaned string with only alphanumeric characters and spaces.
    """
def clean_string(input_str: str) -> str {
    cleaned_str = re.sub(r'[^a-zA-Z0-9 ]', '', input_str);
    return cleaned_str;
}

