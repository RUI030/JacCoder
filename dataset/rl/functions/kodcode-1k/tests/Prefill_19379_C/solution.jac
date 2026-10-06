"""
    Takes an integer as input and returns the sum of its digits in reverse order.
    """
def reverse_sum_of_digits(n: int) -> int {
    n = abs(n);
    reversed_digits_sum = int(str(n)[::-1]);
    return reversed_digits_sum;
}

