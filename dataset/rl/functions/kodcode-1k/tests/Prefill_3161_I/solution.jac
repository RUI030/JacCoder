"""
    Swaps the elements at indices i and j in the list lst.
    If i or j are out of bounds, the function does nothing.
    """
def swap_elements(lst: list[int], i: int, j: int) -> list[int] {
    if not ((0 <= i < len(lst)) and (0 <= j < len(lst))) {
        return lst;
    }
    (lst[i], lst[j]) = (lst[j], lst[i]);
    return lst;
}

