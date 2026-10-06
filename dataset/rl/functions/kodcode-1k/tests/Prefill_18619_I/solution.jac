"""
    Returns a list of the first `n` Fibonacci numbers.
    """
def fibonacci_sequence(n: int) -> list[int] {
    if (n <= 0) {
        return [];
    }
    fib_list = [0] * n;
    if (n > 0) {
        fib_list[0] = 0;
    }
    if (n > 1) {
        fib_list[1] = 1;
    }
    for i in range(2, n) {
        fib_list[i] = fib_list[(i - 1)] + fib_list[(i - 2)];
    }
    return fib_list;
}

