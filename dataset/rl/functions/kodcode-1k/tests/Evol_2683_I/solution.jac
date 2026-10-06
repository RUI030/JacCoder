"""
    Returns a new list containing only the elements that are unique within the original list,
    maintaining their original order of appearance.

    Args:
    lst (list): List of integers.

    Returns:
    list: List of unique integers.
    """
def get_unique_elements(lst: list[int]) -> list[int] {
    import from collections { Counter }
    counts = Counter(lst);
    unique_elements = [
        elem
        for elem in lst
        if (counts[elem] == 1)
    ];
    return unique_elements;
}

