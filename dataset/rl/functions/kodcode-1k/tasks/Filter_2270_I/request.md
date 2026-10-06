# remove_elements

function remove_elements(input_list):
    """
    Removes elements from input_list with values less than or equal to 10.
    Args:
        input_list (list): A list of integers.
    Returns:
        list: The updated list with elements greater than 10.
    """
    result = []
    for element in input_list:
        if element > 10:
            result.append(element)
    return result

Example:
- `remove_elements([11, 12, 20, 13, 25]) == [11, 12, 20, 13, 25]`

Implement `remove_elements(input_list: list[int]) -> list[int]`.
