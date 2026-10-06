import from typing { List, Optional }
"""
    Processes a list of elements that may contain integers or None.
    Returns the sum of all integers in the list, skipping None values.
    If the list is empty or contains only None values, returns 0.
    """
def process_data(data: list[int | None]) -> int {
    return sum(
        x
        for x in data
        if (x is not None)
    );
}

