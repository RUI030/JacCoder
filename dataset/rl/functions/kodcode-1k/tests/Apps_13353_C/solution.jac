"""
    Finds the element that appears only once in the list where every other element appears twice.

    Args:
        lst (list): A list of integers with exactly one unique element and all other elements appearing twice.

    Returns:
        int: The element that appears only once.
    """
def find_unique_element(lst: list[int]) -> int {
    unique = 0;
    for num in lst {
        unique ^= num;
    }
    return unique;
}

