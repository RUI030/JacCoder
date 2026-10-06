"""
    Returns True if the number is divisible by all elements in the list 'divisors', otherwise False.
    """
def is_divisible_by_all(number: int, divisors: list[int]) -> bool {
    for divisor in divisors {
        if ((divisor == 0) or ((number % divisor) != 0)) {
            return False;
        }
    }
    return True;
}

