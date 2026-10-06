"""
    Returns the sum of the digits of the integer n.
    If n is negative, the function returns the sum of the absolute values of the digits.
    """
def sum_of_digits(n: int) -> int {
    n = abs(n);
    digits = [int(digit) for digit in str(n)];
    return sum(digits);
}

