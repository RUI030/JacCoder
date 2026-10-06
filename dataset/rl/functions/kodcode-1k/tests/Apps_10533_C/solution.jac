"""
    Returns a dictionary mapping each unique character to its frequency in the
    string 's'. The function is case-insensitive.

    Parameters:
    s (str): The input string

    Returns:
    dict: A dictionary with characters as keys and their frequencies as values
    """
def char_frequency(s: str) -> dict[str, int] {
    freq = {};
    for char in s.lower() {
        if (char in freq) {
            freq[char] += 1;
        } else {
            freq[char] = 1;
        }
    }
    return freq;
}

