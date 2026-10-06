import math;
"""
    Returns True if n is a perfect square, else False.
    """
def is_perfect_square(n: int) -> bool {
    if (n < 0) {
        return False;
    }
    sqrt_n = int(math.sqrt(n));
    return ((sqrt_n * sqrt_n) == n);
}

