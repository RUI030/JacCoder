"""
    Returns a new list with all elements unique, maintained in their original order of appearance,
    and filters out those elements which appear more than a specified frequency.

    Parameters:
    lst (list): The input list of elements
    frequency (int): The frequency threshold for filtering elements

    Returns:
    list: A new list with filtered elements
    """
def filter_elements(lst: list[int], frequency: int) -> list[int] {
    import from collections { Counter }
    element_counter = Counter(lst);
    result = [];
    for element in lst {
        if ((element_counter[element] <= frequency) and (element not in result)) {
            result.append(element);
        }
    }
    return result;
}

