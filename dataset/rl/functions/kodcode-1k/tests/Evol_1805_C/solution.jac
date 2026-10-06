"""
    Calculates the number of steps required for the Collatz sequence to reach 1.

    Parameters:
    n (int): A positive integer to start the sequence.

    Returns:
    int: The number of steps required to reach 1.
    """
def collatz_steps(n: int) -> int {
    steps = 0;
    while (n != 1) {
        if ((n % 2) == 0) {
            n = n // 2;
        } else {
            n = (3 * n) + 1;
        }
        steps += 1;
    }
    return steps;
}

