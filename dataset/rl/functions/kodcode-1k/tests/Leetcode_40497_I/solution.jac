"""
    Reorder the array of strings `words` according to the standard lexicographical order.

    Parameters:
        order (str): A permutation of the lowercase English letters.
        words (list): An array of strings sorted according to the order defined by `order`.

    Returns:
        list: The reordered array of strings according to standard lexicographical order.
    """
def reorder_to_standard_lexicographical(order: str, words: list[str]) -> list[str] {
    return sorted(words);
}

