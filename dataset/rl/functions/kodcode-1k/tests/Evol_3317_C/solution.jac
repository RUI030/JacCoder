"""
    Returns a new array containing only the unique elements from the original array, in descending order.
    """
def unique_descending(arr: list[int]) -> list[int] {
    unique_elements = `set(arr);
    unique_desc_list = sorted(unique_elements, reverse=True);
    return unique_desc_list;
}

