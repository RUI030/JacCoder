"""
    Determines if the given integer n is a power of two.

    :param n: integer
    :return: True if n is a power of two, False otherwise
    """
def is_power_of_two(n: int) -> bool {
    if (n <= 0) {
        return False;
    }
    return ((n & (n - 1)) == 0);
}

