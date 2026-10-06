"""
    Given a positive integer n, return the nth digit in the concatenated sequence of positive integers.
    """
def find_nth_digit(n: int) -> int {
    length = 1;
    count = 9;
    start = 1;
    while (n > (length * count)) {
        n -= length * count;
        length += 1;
        count *= 10;
        start *= 10;
    }
    start += (n - 1) // length;
    s = str(start);
    return int(s[((n - 1) % length)]);
}

