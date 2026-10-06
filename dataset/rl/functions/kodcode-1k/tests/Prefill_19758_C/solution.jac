"""
    Returns a dictionary with the frequency of each character in the string s.
    """
def char_frequency(s: str) -> dict[str, int] {
    frequency = {};
    for char in s {
        if (char in frequency) {
            frequency[char] += 1;
        } else {
            frequency[char] = 1;
        }
    }
    return frequency;
}

