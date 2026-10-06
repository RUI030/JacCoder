"""
    Returns the highest odd number in the list. If there are no odd numbers,
    returns None.
    """
def highest_odd(numbers: list[int]) -> int | None {
    odd_numbers = [
        num
        for num in numbers
        if ((num % 2) != 0)
    ];
    if not odd_numbers {
        return None;
    }
    return max(odd_numbers);
}

