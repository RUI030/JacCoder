"""
    Returns the second largest number in a list of integers.
    If the list does not have at least two distinct numbers, return None.
    """
def second_largest(numbers: list[int]) -> int | None {
    if (len(numbers) < 2) {
        return None;
    }
    unique_numbers = `list(`set(numbers));
    if (len(unique_numbers) < 2) {
        return None;
    }
    unique_numbers.sort();
    return unique_numbers[-2];
}

