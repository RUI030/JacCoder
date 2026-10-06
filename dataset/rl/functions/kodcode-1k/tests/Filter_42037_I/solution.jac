"""
    Accepts a list of numbers and returns a list of the squares of the numbers.

    Args:
    numbers (list): List of numbers.

    Returns:
    list: A list containing the squares of the input numbers.
    """
def square_list(numbers: list[int]) -> list[int] {
    return [(x ** 2) for x in numbers];
}

