"""
    Given a list of integers and a threshold, returns a new list containing
    the squares of all integers from the input list that are greater than
    or equal to the given threshold. The order of elements in the new list
    is the same as in the original list.

    :param nums: List of integers
    :param threshold: Integer threshold
    :return: New list containing squares of filtered integers
    """
def filter_and_square(nums: list[int], threshold: int) -> list[int] {
    return [
        (num ** 2)
        for num in nums
        if (num >= threshold)
    ];
}

