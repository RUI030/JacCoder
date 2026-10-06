"""
    Generate an acronym from the given phrase by taking the
    first letter of each word and converting them to uppercase.

    Parameters:
    - phrase: str: A string consisting of words separated by spaces.

    Returns:
    - str: The acronym formed by the first letter of each word in uppercase.
    """
def generate_acronym(phrase: str) -> str {
    return ''.join(word[0].upper() for word in phrase.split());
}

