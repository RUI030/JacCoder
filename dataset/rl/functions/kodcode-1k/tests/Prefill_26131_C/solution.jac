"""
    Returns the sum of all integers in the range from m to n (inclusive).
    """
def sum_of_range(m: int, n: int) -> int {
    if (m > n) {
        return 0;
    }
    return sum(range(m, (n + 1)));
}

