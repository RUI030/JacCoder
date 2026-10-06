"""
    Find and return the nth digit of the infinite sequence of concatenated positive integers.
    """
def find_nth_digit(n: int) -> int {
    digits_length = 1;
    count = 9;
    start = 1;
    while (n > (digits_length * count)) {
        n -= digits_length * count;
        digits_length += 1;
        count *= 10;
        start *= 10;
    }
    start += (n - 1) // digits_length;
    digit_index = (n - 1) % digits_length;
    return int(str(start)[digit_index]);
}

