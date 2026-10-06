"""
    Returns a list of the first n Fibonacci numbers.
    Fibonacci series starts with 0 and 1, and the next numbers
    are the sum of the previous two.
    """
def generate_fibonacci(n: int) -> list[int] {
    if (n <= 0) {
        return [];
    } elif (n == 1) {
        return [0];
    }
    fibonacci_list = [0, 1];
    while (len(fibonacci_list) < n) {
        fibonacci_list.append((fibonacci_list[-1] + fibonacci_list[-2]));
    }
    return fibonacci_list;
}

