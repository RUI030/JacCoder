"""
    Determines if the given number is a Magic Number.
    A Magic Number eventually reduces to 1 when the sum
    of its digits is repeatedly calculated until a single
    digit is obtained.

    Parameters:
    n (int): The non-negative integer number.

    Returns:
    bool: True if n is a Magic Number, False otherwise.
    """
def is_magic_number(n: int) -> bool {
    if (n == 0) {
        return False;
    }
    while (n >= 10) {
        n = sum(int(digit) for digit in str(n));
    }
    return (n == 1);
}

