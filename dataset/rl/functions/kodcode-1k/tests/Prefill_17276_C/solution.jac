"""
    Returns the sum of the digits of the integer part of the given number.
    """
def first_digit_sum(num: float) -> int {
    integer_part = abs(int(num));
    digit_sum = sum(int(digit) for digit in str(integer_part));
    return digit_sum;
}

