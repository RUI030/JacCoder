"""
    Multiplies all elements of the list.
    Returns the result or 1 if the list is empty.
    """
def multiply_elements(elements: list[int]) -> int {
    result = 1;
    for element in elements {
        result *= element;
    }
    return result;
}

