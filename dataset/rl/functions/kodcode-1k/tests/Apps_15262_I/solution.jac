"""
    Returns a list of the first n numbers in the Fibonacci sequence.
    """
def fibonacci_sequence(n: int) -> list[int] {
    if (n == 0) {
        return [];
    } elif (n == 1) {
        return [0];
    }
    fib_sequence = [0, 1];
    while (len(fib_sequence) < n) {
        next_fib = fib_sequence[-1] + fib_sequence[-2];
        fib_sequence.append(next_fib);
    }
    return fib_sequence;
}

