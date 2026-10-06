"""
    Reverses the digits of the input integer num. If the reversed integer is outside the 32-bit signed integer
    range [-2^31, 2^31 - 1], returns 0.
    """
def reverse_integer(num: int) -> int {
    (INT_MIN, INT_MAX) = (-(2 ** 31), ((2 ** 31) - 1));
    negative = num < 0;
    num = abs(num);
    reversed_num = 0;
    while (num != 0) {
        digit = num % 10;
        num //= 10;
        if (reversed_num > ((INT_MAX - digit) // 10)) {
            return 0;
        }
        reversed_num = (reversed_num * 10) + digit;
    }
    return -reversed_num if negative else reversed_num;
}

