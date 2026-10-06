import from typing { List }
"""
    Sorts a list of strings in decreasing order of their lengths.

    Parameters:
        strings (List[str]): The list of strings to sort.

    Returns:
        List[str]: The sorted list of strings by decreasing length.
    """
def sort_by_length(strings: list[str]) -> list[str] {
    return sorted(strings, key=len, reverse=True);
}

