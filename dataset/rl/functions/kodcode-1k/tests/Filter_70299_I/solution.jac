"""
    Returns the first n Fibonacci numbers as a list.
    """
def fibonacci(n: int) -> list[int] {
    if (n <= 0) {
        return [];
    } elif (n == 1) {
        return [0];
    } elif (n == 2) {
        return [0, 1];
    }
    fib_seq = [0, 1];
    for i in range(2, n) {
        next_fib = fib_seq[-1] + fib_seq[-2];
        fib_seq.append(next_fib);
    }
    return fib_seq;
}
with entry {
    if (__name__ == "__main__") {
        n = int(input("Enter the number of Fibonacci numbers to generate: "));
        print(fibonacci(n));
    }
}

