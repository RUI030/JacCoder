"""
    Shifts each character in the string `s` forward by `k` positions in the alphabet.
    Wraps around if the shift goes past 'z'.

    :param s: str, a string of lowercase English letters
    :param k: int, non-negative integer
    :return: str, the transformed string
    """
def shift_string(s: str, k: int) -> str {
    shifted_string = "";
    for char in s {
        new_char = chr(((((ord(char) - ord('a')) + k) % 26) + ord('a')));
        shifted_string += new_char;
    }
    return shifted_string;
}

