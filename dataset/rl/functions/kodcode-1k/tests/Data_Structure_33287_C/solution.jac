"""
    Finds the extra character added to string t.

    :param s: Original string.
    :param t: Modified string with one additional character.
    :return: The extra character.
    """
def find_difference(s: str, t: str) -> str {
    result = 0;
    for char in (s + t) {
        result ^= ord(char);
    }
    return chr(result);
}

