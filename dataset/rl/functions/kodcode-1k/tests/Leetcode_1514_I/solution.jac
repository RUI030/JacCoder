"""
    Shuffles the string s according to the indices array.

    Parameters:
    s (str): The input string to be shuffled.
    indices (list of int): The list of indices that represents the new positions of the characters.

    Returns:
    str: The shuffled string.
    """
def shuffle_string(s: str, indices: list[int]) -> str {
    shuffled = [''] * len(s);
    for (i, index) in enumerate(indices) {
        shuffled[index] = s[i];
    }
    return ''.join(shuffled);
}

