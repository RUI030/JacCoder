"""
    Returns the sum of all integers from num1 to num2 (inclusive).
    If num1 is greater than num2, returns -1 to indicate an error.
    """
def sum_range(num1: int, num2: int) -> int {
    if (num1 > num2) {
        return -1;
    }
    return sum(range(num1, (num2 + 1)));
}

