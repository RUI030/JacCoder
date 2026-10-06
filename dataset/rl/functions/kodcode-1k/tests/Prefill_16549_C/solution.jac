"""
    Returns a list of numbers from start to end (inclusive) that are divisible by both 3 and 5.
    """
def divisible_by_3_and_5(start: int, end: int) -> list[int] {
    return [
        i
        for i in range(start, (end + 1))
        if (((i % 3) == 0) and ((i % 5) == 0))
    ];
}

