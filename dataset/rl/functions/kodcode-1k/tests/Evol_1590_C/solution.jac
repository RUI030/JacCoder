"""
    Identifies and returns the smallest integer in a given list of numbers that appears more than once.
    If no such number exists, returns None.
    """
def smallest_repeated_number(numbers: list[int]) -> int | None {
    import from collections { Counter }
    count = Counter(numbers);
    repeated_numbers = [
        num
        for (num, freq) in count.items()
        if (freq > 1)
    ];
    return min(repeated_numbers) if repeated_numbers else None;
}

