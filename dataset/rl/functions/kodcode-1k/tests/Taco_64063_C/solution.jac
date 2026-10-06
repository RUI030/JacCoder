"""
    Returns a new list where each positive integer from the input list is doubled,
    while negative integers and zero are left unchanged.

    Parameters:
    numbers (list of int): List of integers, each can be positive, negative, or zero.

    Returns:
    list of int: New list with positive integers doubled and others unchanged.
    """
def double_positives(numbers: list[int]) -> list[int] {
    return [(x * 2) if (x > 0) else x for x in numbers];
}

