"""
    Returns a list with duplicates removed, preserving the order of first occurrences.

    Parameters:
    lst (list): A list of integers.

    Returns:
    list: A list without duplicates.
    """
def remove_duplicates(lst: list[int]) -> list[int] {
    seen = `set();
    result = [];
    for item in lst {
        if (item not in seen) {
            seen.add(item);
            result.append(item);
        }
    }
    return result;
}

