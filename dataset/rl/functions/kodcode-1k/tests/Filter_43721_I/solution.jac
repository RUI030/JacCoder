"""
    Returns a list of integers that are even and greater than 10.
    """
def filter_even_and_greater_than_ten(numbers: list[int]) -> list[int] {
    return [
        num
        for num in numbers
        if ((num > 10) and ((num % 2) == 0))
    ];
}

