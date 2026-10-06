import from typing { List }
"""
    Returns the sum of all elements in `arr` excluding those present in `exclude`.

    Parameters:
        - arr (List[int]): The list of elements to sum.
        - exclude (List[int]): The list of elements to exclude from the sum.

    Returns:
        int: The sum of elements in `arr` excluding those in `exclude`.
    """
def sum_excluding_elements(arr: list[int], exclude: list[int]) -> int {
    exclude_set = `set(exclude);
    return sum(
        x
        for x in arr
        if (x not in exclude_set)
    );
}

