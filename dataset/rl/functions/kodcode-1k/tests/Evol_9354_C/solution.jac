import from typing { Any }
"""
    Sorts a list of tuples by the second element in each tuple.

    Parameters:
    tuples_list (list of tuple): List of tuples to be sorted.

    Returns:
    list of tuple: Sorted list of tuples by the second element.
    """
def sort_by_second_element(tuples_list: list[tuple[int, int]]) -> list[tuple[int, int]] {
    return sorted(tuples_list, key=lambda (x: Any) { x[1]; });
}

