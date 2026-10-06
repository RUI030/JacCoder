"""
    Filters out integers not within the range [min_val, max_val] from the list,
    and returns the sorted list of remaining integers.

    :param numbers: List of integers
    :param min_val: Minimum value of the range (inclusive)
    :param max_val: Maximum value of the range (inclusive)
    :return: Sorted list of integers within the range [min_val, max_val]
    """
def filter_and_sort(numbers: list[int], min_val: int, max_val: int) -> list[int] {
    filtered_numbers = [
        num
        for num in numbers
        if (min_val <= num <= max_val)
    ];
    return sorted(filtered_numbers);
}

