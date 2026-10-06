import from typing { List }
"""
    This function takes a list of digits representing a non-negative number
    and returns a new list representing the number incremented by one.
    """
def increment_digit_array(digits: list[int]) -> list[int] {
    n = len(digits);
    carry = 1;
    for i in range((n - 1), -1, -1) {
        new_digit = digits[i] + carry;
        if (new_digit == 10) {
            digits[i] = 0;
            carry = 1;
        } else {
            digits[i] = new_digit;
            carry = 0;
            break;
        }
    }
    if carry {
        digits.insert(0, 1);
    }
    return digits;
}

