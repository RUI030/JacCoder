"""
    Removes all zeros from the input list.

    Args:
    input_list (list): List of integers.

    Returns:
    list: A new list with all zeros removed.
    """
def remove_zeros(input_list: list[int]) -> list[int] {
    return [
        x
        for x in input_list
        if (x != 0)
    ];
}

