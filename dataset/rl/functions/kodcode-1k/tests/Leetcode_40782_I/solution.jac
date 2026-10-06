"""
    Given a list of integers sorted in non-decreasing order,
    returns a list of the squares of each number, also sorted in non-decreasing order.
    """
def sorted_squares(arr: list[int]) -> list[int] {
    result = [(x ** 2) for x in arr];
    result.sort();
    return result;
}

