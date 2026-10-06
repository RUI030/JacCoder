import from typing { List }
"""
    Determines if all elements in the array are unique.

    Args:
    arr (List[int]): A list of integers.

    Returns:
    bool: True if all elements are unique, False otherwise.
    """
def all_unique(arr: list[int]) -> bool {
    return (len(arr) == len(`set(arr)));
}

