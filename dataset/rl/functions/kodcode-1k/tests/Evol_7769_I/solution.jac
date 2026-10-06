"""
    Takes a list of strings and returns a dictionary where the keys are the unique strings
    from the list and the values are the number of times each string appears.

    :param strings: List of strings
    :return: Dictionary with string counts
    """
def count_strings(strings: list[str]) -> dict[str, int] {
    string_counts = {};
    for s in strings {
        if (s in string_counts) {
            string_counts[s] += 1;
        } else {
            string_counts[s] = 1;
        }
    }
    return string_counts;
}

