"""
    Removes elements from input_list with values less than or equal to 10.

    Args:
        input_list (list): A list of integers.

    Returns:
        list: The updated list with elements greater than 10.
    """
def remove_elements(input_list: list[int]) -> list[int] {
    result = [];
    for element in input_list {
        if (element > 10) {
            result.append(element);
        }
    }
    return result;
}

