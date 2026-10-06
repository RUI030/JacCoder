import re;
"""
    Removes the text between the specified start and end delimiters, including the delimiters themselves.
    """
def remove_text_between_delimiters(text: str, start_delim: str, end_delim: str) -> str {
    pattern = re.escape(start_delim) + '.*?' + re.escape(end_delim);
    return re.sub(pattern, '', text);
}

