"""
    Returns a new string with each word reversed but with the words in the original order.
    """
def word_mirror_madness(s: str) -> str {
    return ' '.join(word[::-1] for word in s.split(' '));
}

