"""
    Returns a list where each element is the difference between the corresponding elements
    of the input list and the average of the input list.

    Args:
    numbers (list of int): A list of integers

    Returns:
    list of float: A new list where each element is the difference from the average.
    """
def differences_from_average(numbers: list[int]) -> list[float] {
    if not numbers {
        return [];
    }
    average = sum(numbers) / len(numbers);
    return [round((num - average), 1) for num in numbers];
}

