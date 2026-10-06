import math;
"""
    Returns the greatest common divisor of three integers a, b, and c.
    """
def gcd_of_three(a: int, b: int, c: int) -> int {
    return math.gcd(math.gcd(a, b), c);
}

