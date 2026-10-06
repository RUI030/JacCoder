"""
    Checks whether the given number is divisible by 3 or not.

    Parameters:
    number (int): The integer to check for divisibility by 3.

    Returns:
    bool: True if the number is divisible by 3, False otherwise.
    """
def is_divisible_by_3(number: int) -> bool {
    return ((number % 3) == 0);
}

