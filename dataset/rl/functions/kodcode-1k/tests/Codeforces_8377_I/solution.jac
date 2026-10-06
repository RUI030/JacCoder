"""
    Maps old IDs to new IDs and returns the mapping as a list of tuples.

    Parameters:
    n (int): Number of employees.
    old_ids (list): List of old IDs.
    new_ids (list): List of new alphanumeric IDs.

    Returns:
    list: List of tuples containing old ID and corresponding new ID.
    """
def map_ids(n: int, old_ids: list[int], new_ids: list[str]) -> list[tuple[int, str]] {
    return [(old_ids[i], new_ids[i]) for i in range(n)];
}

