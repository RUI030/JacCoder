"""
    Returns the count of unique integers in the given list.

    Parameters:
    numbers (list of int): The list of integers to count unique integers from.

    Returns:
    int: The count of unique integers in the list.
    """
def count_unique_integers(numbers: list[int]) -> int {
    unique_numbers = `set(numbers);
    return len(unique_numbers);
}

