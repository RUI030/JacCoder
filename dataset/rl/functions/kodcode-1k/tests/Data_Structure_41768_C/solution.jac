"""
    Computes Euler's Totient Function for an integer n.

    Args:
    n (int): the integer to compute the totient function for.

    Returns:
    int: the count of integers from 1 to n that are coprime with n.
    """
def efficient_phi(n: int) -> int {
    if (n == 1) {
        return 1;
    }
    result = n;
    p = 2;
    while ((p * p) <= n) {
        if ((n % p) == 0) {
            while ((n % p) == 0) {
                n //= p;
            }
            result -= result // p;
        }
        p += 1;
    }
    if (n > 1) {
        result -= result // n;
    }
    return result;
}

