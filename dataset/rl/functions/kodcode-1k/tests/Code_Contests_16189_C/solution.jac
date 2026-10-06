"""
    Returns the sum of the squares of the first n positive integers.
    """
def sum_of_squares(n: int) -> int {
    return sum((i ** 2) for i in range(1, (n + 1)));
}

