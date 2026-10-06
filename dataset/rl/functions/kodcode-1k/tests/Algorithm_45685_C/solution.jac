"""
    Strips all special characters from the input string, converts all alphabetic characters to lowercase,
    and then sorts all the characters in increasing order of their ASCII values.

    Args:
    input_str (str): The input string consisting of alpha-numeric and special characters.

    Returns:
    str: A new string containing sorted alpha-numeric characters in increasing ASCII order, all in lowercase.
    """
def strip_and_sort(input_str: str) -> str {
    alphanumeric_chars = [
        char.lower()
        for char in input_str
        if char.isalnum()
    ];
    sorted_chars = sorted(alphanumeric_chars);
    sorted_str = ''.join(sorted_chars);
    return sorted_str;
}

