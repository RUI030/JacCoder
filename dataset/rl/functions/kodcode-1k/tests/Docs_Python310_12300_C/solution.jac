import re;
"""
    Processes the input string by parsing out numeric and alphabetic components,
    summing the numeric components, and concatenating the alphabetic components.

    Args:
    input_string (str): The input string consisting of alternating numeric and alphabetic components.

    Returns:
    str: A formatted string "Sum: <total_sum>, Concatenated String: <concatenated_string>"
    """
def process_data(input_string: str) -> str {
    numeric_components = `list(map(int, re.findall(r'\d+', input_string)));
    alphabetic_components = re.findall(r'[a-zA-Z]+', input_string);
    total_sum = sum(numeric_components);
    concatenated_string = ''.join(alphabetic_components);
    result = f"Sum: {total_sum}, Concatenated String: {concatenated_string}";
    return result;
}

