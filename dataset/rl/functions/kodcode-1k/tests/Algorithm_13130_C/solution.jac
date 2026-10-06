"""
    Normalize the string by changing all characters to lowercase,
    removing extra spaces, and ensuring a single space between words.
    """
def normalize_text(text: str) -> str {
    return ' '.join(text.lower().split());
}

