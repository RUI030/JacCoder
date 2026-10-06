"""
    Shifts every character in the string s by 2 positions forward in the alphabet.
    Characters 'y' and 'z' wrap around to 'a' and 'b', respectively.

    Parameters:
    s (str): The input string consisting of lowercase alphabetic characters.

    Returns:
    str: The shifted string.
    """
def shift_string_2(s: str) -> str {
    shifted_string = [];
    for char in s {
        shifted_char = chr(((((ord(char) - ord('a')) + 2) % 26) + ord('a')));
        shifted_string.append(shifted_char);
    }
    return ''.join(shifted_string);
}

