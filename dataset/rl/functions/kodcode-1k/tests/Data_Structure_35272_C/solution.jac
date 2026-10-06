"""
    Calculate the number of digits in the integer n.

    If n is negative, count the digits of its absolute value.
    If n is 0, return 1 as 0 has one digit.

    :param n: Input integer
    :return: Number of digits in the input integer
    """
def num_digits(n: int) -> int {
    if (n == 0) {
        return 1;
    }
    return len(str(abs(n)));
}

