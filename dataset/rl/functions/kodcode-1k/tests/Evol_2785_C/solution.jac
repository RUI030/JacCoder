"""
    Returns a dictionary where each key is a unique character from
    the input string, and the corresponding value is the count of
    occurrences of that character in the string.
    """
def character_count(s: str) -> dict[str, int] {
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

