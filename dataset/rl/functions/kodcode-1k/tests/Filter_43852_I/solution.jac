"""
    Returns a tuple containing the maximum and minimum values in the given list.
    If the list is empty, returns None.
    """
def find_max_min(lst: list[int]) -> tuple[int, int] | None {
    if not lst {
        return None;
    }
    return (max(lst), min(lst));
}

