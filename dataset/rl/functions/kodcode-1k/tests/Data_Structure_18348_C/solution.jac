"""
    Increments a number represented by a list of digits by one.

    :param digits: List of digits representing the number.
    :return: List of digits representing the incremented number.
    """
def increment_digits(digits: list[int]) -> list[int] {
    n = len(digits);
    for i in range((n - 1), -1, -1) {
        if (digits[i] < 9) {
            digits[i] += 1;
            return digits;
        } else {
            digits[i] = 0;
        }
    }
    return ([1] + digits);
}

