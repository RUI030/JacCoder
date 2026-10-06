"""
    Returns a new array with the third power of every element in the input array.

    :param arr: List of numbers
    :return: List of numbers raised to the third power
    """
def cube_elements(arr: list[int]) -> list[int] {
    return [(x ** 3) for x in arr];
}

