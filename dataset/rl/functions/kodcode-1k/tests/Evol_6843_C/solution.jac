"""
    Returns a list of squares of the even numbers in `lst`, but only if their square is greater than 50.
    """
def squares_of_even_numbers_greater_than_50(lst: list[int]) -> list[int] {
    return [
        (x ** 2)
        for x in lst
        if (((x % 2) == 0) and ((x ** 2) > 50))
    ];
}

