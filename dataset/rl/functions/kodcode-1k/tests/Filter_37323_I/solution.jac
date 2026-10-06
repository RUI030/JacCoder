"""
    Determines if a number contains odd digits, identifies if these digits are prime,
    and counts the total number of odd prime digits.

    Args:
    number (int): The input number.

    Returns:
    tuple: (contains_odd_digits (bool), odd_digits_are_prime (bool), odd_prime_digits_count (int))
    """
def odd_prime_digits_info(number: int) -> tuple[bool, bool, int] {
    odd_digits = {'1', '3', '5', '7', '9'};
    prime_digits = {'2', '3', '5', '7'};
    number_str = str(number);
    odd_digit_occurrence = False;
    odd_prime_digits_count = 0;
    for digit in number_str {
        if (digit in odd_digits) {
            odd_digit_occurrence = True;
            if (digit in prime_digits) {
                odd_prime_digits_count += 1;
            }
        }
    }
    if odd_digit_occurrence {
        odd_digits_are_prime = all(
            (digit in prime_digits)
            for digit in number_str
            if (digit in odd_digits)
        );
    } else {
        odd_digits_are_prime = False;
    }
    return (odd_digit_occurrence, odd_digits_are_prime, odd_prime_digits_count);
}

