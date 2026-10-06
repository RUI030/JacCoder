"""
    Calculates the sum of i^i for all i from 1 to n (inclusive).
    """
def calculate_exponential_sum(n: int) -> int {
    return sum((i ** i) for i in range(1, (n + 1)));
}

