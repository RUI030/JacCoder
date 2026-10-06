"""
    Returns a dictionary with the count of each character in the string.
    The counting is case insensitive.
    """
def character_count(s: str) -> dict[str, int] {
    s = s.lower();
    count_dict = {};
    for char in s {
        if (char in count_dict) {
            count_dict[char] += 1;
        } else {
            count_dict[char] = 1;
        }
    }
    return count_dict;
}

