import re;
"""
    Generates hashtags from the given caption.

    Args:
    caption (str): the input caption.

    Returns:
    str: a string of hashtags sorted in alphabetical order.
    """
def generate_hashtags(caption: str) -> str {
    words = re.findall(r'[a-zA-Z]+', caption);
    hashtags = [('#' + word.lower()) for word in words];
    hashtags.sort();
    return ' '.join(hashtags);
}

