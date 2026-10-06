"""
    Filters out odd numbers, numbers divisible by 3, and numbers less than 5.
    Returns the sorted list with unique numbers which are even, not divisible by 3, and >= 5.
    """
def filter_numbers(arr: list[int]) -> list[int] {
    result = `set();
    for num in arr {
        if ((num >= 5) and ((num % 2) == 0) and ((num % 3) != 0)) {
            result.add(num);
        }
    }
    return sorted(result);
}

