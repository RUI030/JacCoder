"""
    Returns the second minimum value in the list.
    If the list has fewer than 2 unique values, returns None.
    """
def second_minimum(lst: list[int]) -> int | None {
    unique_values = `list(`set(lst));
    if (len(unique_values) < 2) {
        return None;
    }
    unique_values.sort();
    return unique_values[1];
}

