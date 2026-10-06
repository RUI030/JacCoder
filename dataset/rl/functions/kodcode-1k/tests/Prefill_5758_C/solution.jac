"""
    Generates a list of Fibonacci numbers up to the given limit.

    Parameters:
    - limit: int, the upper bound (inclusive) for the Fibonacci sequence.

    Returns:
    - list: a list of Fibonacci numbers not exceeding the limit.
    """
def fibonacci_up_to(limit: int) -> list[int] {
    if (limit < 0) {
        return [];
    }
    fib_list = [0, 1];
    while True {
        next_value = fib_list[-1] + fib_list[-2];
        if (next_value > limit) {
            break;
        }
        fib_list.append(next_value);
    }
    return [
        x
        for x in fib_list
        if (x <= limit)
    ];
}

