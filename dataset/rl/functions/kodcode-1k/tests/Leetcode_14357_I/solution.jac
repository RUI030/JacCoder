"""
    Shuffle the string such that the character at the i-th position
    moves to indices[i] in the shuffled string.

    :param s: str - The input string
    :param indices: List[int] - The list of indices representing the target positions
    :return: str - The shuffled string
    """
def shuffle_string(s: str, indices: list[int]) -> str {
    n = len(s);
    shuffled = [''] * n;
    for i in range(n) {
        shuffled[indices[i]] = s[i];
    }
    return ''.join(shuffled);
}

