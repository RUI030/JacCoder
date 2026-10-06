"""
    Returns a list of all prime numbers less than or equal to n.
    """
def find_primes(n: int) -> list[int] {
    if (n < 2) {
        return [];
    }
    is_prime = [True] * (n + 1);
    is_prime[0] = is_prime[1]=False;
    for p in range(2, (int((n ** 0.5)) + 1)) {
        if is_prime[p] {
            for multiple in range((p * p), (n + 1), p) {
                is_prime[multiple] = False;
            }
        }
    }
    return [
        num
        for num in range((n + 1))
        if is_prime[num]
    ];
}

