"""
    Generate a list of Fibonacci numbers up to but not exceeding n.

    Parameters:
    n (int): The upper limit for Fibonacci sequence numbers.

    Returns:
    list: A list of Fibonacci numbers up to but not exceeding n.
    """
def fibonacci_up_to_n(n: int) -> list[int] {
    if (n < 0) {
        return [];
    }
    fib_sequence = [];
    (a, b) = (0, 1);
    while (a <= n) {
        fib_sequence.append(a);
        (a, b) = (b, (a + b));
    }
    return fib_sequence;
}

