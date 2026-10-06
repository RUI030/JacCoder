"""
    Filters out all the even numbers from the list, squares each of the filtered
    even numbers, and returns the resultant list.

    Args:
    numbers (list): A list of integers.

    Returns:
    list: A list of squared even numbers.
    """
def filter_and_square_evens(numbers: list[int]) -> list[int] {
    return [
        (x ** 2)
        for x in numbers
        if ((x % 2) == 0)
    ];
}

