"""
    Returns a tuple containing the sum and absolute difference of two integers.
    """
def sum_and_diff(a: int, b: int) -> tuple[int, int] {
    sum_result = a + b;
    diff_result = abs((a - b));
    return (sum_result, diff_result);
}

