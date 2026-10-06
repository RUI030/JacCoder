"""
    Generates the first n Fibonacci numbers.
    """
def fibonacci(n: int) -> list[int] {
    fib_seq = [];
    (a, b) = (0, 1);
    for _ in range(n) {
        fib_seq.append(a);
        (a, b) = (b, (a + b));
    }
    return fib_seq;
}

