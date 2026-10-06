"""
    Returns the sum of all the multiples of 3 or 5 below the given limit.
    """
def sum_of_multiples(limit: int) -> int {
    return sum(
        i
        for i in range(limit)
        if (((i % 3) == 0) or ((i % 5) == 0))
    );
}

