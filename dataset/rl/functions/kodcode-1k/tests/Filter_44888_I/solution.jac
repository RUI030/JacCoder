"""
    Returns the second largest number in the list or None if there are not at least
    two distinct numbers.
    """
def second_largest(numbers: list[int]) -> int | None {
    if (len(numbers) < 2) {
        return None;
    }
    first_max = second_max=None;
    for num in numbers {
        if ((first_max is None) or (num > first_max)) {
            second_max = first_max;
            first_max = num;
        } elif ((num != first_max) and ((second_max is None) or (num > second_max))) {
            second_max = num;
        }
    }
    return second_max;
}

