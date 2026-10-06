"""
    Returns the index of the last occurrence of ch in s.
    If ch is not found, returns -1.

    :param s: str - The input string
    :param ch: str - The character to find
    :return: int - The index of the last occurrence of ch in s or -1 if not found
    """
def last_occurrence(s: str, ch: str) -> int {
    return s.rfind(ch);
}

