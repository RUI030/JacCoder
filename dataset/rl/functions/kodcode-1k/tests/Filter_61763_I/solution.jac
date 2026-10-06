import re;
"""
    Extracts the first word from the given string.

    Args:
    text (str): The string from which to extract the first word.

    Returns:
    str: The first word of the provided string or empty string if no word is found.
    """
def extract_first_word(text: str) -> str {
    `match = re.search(r'\b\w+\b', text);
    if `match {
        return `match.group(0);
    }
    return "";
}

