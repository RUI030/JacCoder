"""
    This function sorts the input list such that the odd numbers are sorted in non-decreasing order
    and placed in their original positions. The even numbers remain unchanged in their original positions.

    Args:
    lst (list of int): A list of integers.

    Returns:
    list of int: The list sorted in the specified manner.
    """
def special_sort(lst: list[int]) -> list[int] {
    odd_numbers = [
        num
        for num in lst
        if ((num % 2) != 0)
    ];
    odd_numbers.sort();
    odd_iter = iter(odd_numbers);
    result = [next(odd_iter) if ((num % 2) != 0) else num for num in lst];
    return result;
}

