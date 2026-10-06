"""
    Returns the sum of the first n Fibonacci numbers.
    """
def generate_fibonacci_sum(n: int) -> int {
    if (n <= 0) {
        return 0;
    }
    fib = [0, 1];
    for i in range(2, n) {
        fib.append((fib[-1] + fib[-2]));
    }
    return sum(fib[:n]);
}

