"""
    Returns 'Prime' if n is a prime number, else returns 'Not prime'.
    """
def is_prime(n: int) -> str {
    if (n <= 1) {
        return "Not prime";
    }
    if (n == 2) {
        return "Prime";
    }
    if ((n % 2) == 0) {
        return "Not prime";
    }
    for i in range(3, (int((n ** 0.5)) + 1), 2) {
        if ((n % i) == 0) {
            return "Not prime";
        }
    }
    return "Prime";
}

