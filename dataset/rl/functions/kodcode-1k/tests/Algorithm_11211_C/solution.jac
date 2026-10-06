"""
    Returns the nth prime number.
    """
def nth_prime(n: int) -> int {
    limit = 10000;
    sieve = [True] * limit;
    sieve[0] = sieve[1]=False;
    p = 2;
    while ((p * p) < limit) {
        if (sieve[p] is True) {
            for i in range((p * p), limit, p) {
                sieve[i] = False;
            }
        }
        p += 1;
    }
    primes = [
        p
        for p in range(limit)
        if (sieve[p] is True)
    ];
    return primes[(n - 1)];
}

