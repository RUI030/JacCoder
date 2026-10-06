"""
    Returns a list of squares of all odd numbers in the input list in reverse order.
    """
def reverse_squares_of_odds(numbers: list[int]) -> list[int] {
    return [
        (x ** 2)
        for x in numbers
        if ((x % 2) != 0)
    ][::-1];
}

