import math;
"""
    Returns a list of factors of the given number n.
    """
def find_factors(n: int) -> list[int] {
    factors = [];
    for i in range(1, (int(math.sqrt(n)) + 1)) {
        if ((n % i) == 0) {
            factors.append(i);
            if (i != (n // i)) {
                factors.append((n // i));
            }
        }
    }
    factors.sort();
    return factors;
}

