import math;
"""
    Returns True if n is a perfect square, False otherwise.
    A perfect square is an integer that is the square of another integer.
    """
def is_perfect_square(n: int) -> bool {
    if (n < 0) {
        return False;
    }
    `root = int(math.sqrt(n));
    return ((`root * `root) == n);
}

