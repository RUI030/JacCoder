import from math { factorial }
"""
    Calculates the binomial coefficient C(n, k) which represents the number
    of ways to choose k elements from a set of n distinct elements.

    Args:
    n (int): Total number of distinct elements
    k (int): Number of elements to choose

    Returns:
    int: The binomial coefficient C(n, k)
    """
def binomial_coefficient(n: int, k: int) -> int {
    if (k > n) {
        return 0;
    }
    if ((k == 0) or (k == n)) {
        return 1;
    }
    k = min(k, (n - k));
    numerator = factorial(n);
    denominator = factorial(k) * factorial((n - k));
    return (numerator // denominator);
}

