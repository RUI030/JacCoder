"""
    Returns a list of all possible substrings of the input string, ordered by length in reverse.
    """
def substrings_in_reverse_order(input_string: str) -> list[str] {
    substrings = [];
    length = len(input_string);
    for i in range(length) {
        for j in range((i + 1), (length + 1)) {
            substrings.append(input_string[i:j]);
        }
    }
    substrings.sort(key=len, reverse=True);
    return substrings;
}

