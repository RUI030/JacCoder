"""
    Returns the Fibonacci sequence up to the nth term.

    Parameters:
    n (int): the number of terms in the Fibonacci sequence

    Returns:
    list[int]: Fibonacci sequence up to the nth term
    """
def fibonacci_sequence(n: int) -> list[int] {
    if (n <= 0) {
        return [];
    } elif (n == 1) {
        return [0];
    } elif (n == 2) {
        return [0, 1];
    }
    sequence = [0, 1];
    for i in range(2, n) {
        sequence.append((sequence[-1] + sequence[-2]));
    }
    return sequence;
}

