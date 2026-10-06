"""
    Returns a new list where each element in the original list is duplicated consecutively.

    Parameters:
    lst (list): A list of integers.

    Returns:
    list: A new list with each element duplicated.
    """
def duplicate_consecutively(lst: list[int]) -> list[int] {
    result = [];
    for item in lst {
        result.extend([item, item]);
    }
    return result;
}

