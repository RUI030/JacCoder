"""
    Returns the sum of Fibonacci sequence numbers up to the given number n.
    If n is zero or negative, the sum will be zero.
    """
def sum_fibonacci(n: int) -> int {
    if (n <= 0) {
        return 0;
    }
    (fib1, fib2) = (0, 1);
    total_sum = 0;
    while (fib1 <= n) {
        total_sum += fib1;
        (fib1, fib2) = (fib2, (fib1 + fib2));
    }
    return total_sum;
}

