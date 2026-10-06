"""
    Returns a list of prime numbers less than n.

    :param n: Integer
    :return: List of prime numbers less than n
    """
def getPrimes(n: int) -> list[int] {
    if (n <= 2) {
        return [];
    }
    primes = [];
    is_prime = [True] * n;
    is_prime[0] = is_prime[1]=False;
    for i in range(2, n) {
        if is_prime[i] {
            primes.append(i);
            for j in range((i * i), n, i) {
                is_prime[j] = False;
            }
        }
    }
    return primes;
}

