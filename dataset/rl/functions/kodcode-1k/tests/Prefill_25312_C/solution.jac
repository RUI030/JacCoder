"""
    Returns a new list containing the squares of the original numbers.

    Args:
    numbers (list of int): The list of integers to square.

    Returns:
    list of int: A list containing the squares of the original numbers.
    """
def square_list(numbers: list[int]) -> list[int] {
    return [(num ** 2) for num in numbers];
}

