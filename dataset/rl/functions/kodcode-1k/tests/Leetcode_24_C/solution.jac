"""
    Returns a list of all prime numbers less than n using the Sieve of Eratosthenes algorithm.
    """
def sieve_of_eratosthenes(n: int) -> list[int] {
    if (n <= 2) {
        return [];
    }
    primes = [True] * n;
    primes[0] = primes[1]=False;
    for start in range(2, (int((n ** 0.5)) + 1)) {
        if primes[start] {
            for multiple in range((start * start), n, start) {
                primes[multiple] = False;
            }
        }
    }
    return [
        num
        for (num, is_prime) in enumerate(primes)
        if is_prime
    ];
}

