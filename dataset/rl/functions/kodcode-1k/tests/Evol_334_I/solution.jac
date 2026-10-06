"""
    Returns a new string with only the first occurrence of each character in the original string,
    such that the new string is at most k characters long.

    Parameters:
    s (str): The input string.
    k (int): The maximum length of the new string.

    Returns:
    str: The new string with unique characters.
    """
def unique_k_chars(s: str, k: int) -> str {
    unique_chars = [];
    seen = `set();
    for char in s {
        if (char not in seen) {
            seen.add(char);
            unique_chars.append(char);
        }
        if (len(unique_chars) == k) {
            break;
        }
    }
    return ''.join(unique_chars);
}

