"""
    Generates a list of prime numbers up to a given number n using the Sieve of Eratosthenes algorithm.
    """
def sieve_of_eratosthenes(n: int) -> list[int] {
    if (n < 2) {
        return [];
    }
    sieve = [True] * (n + 1);
    sieve[0] = sieve[1]=False;
    for start in range(2, (int((n ** 0.5)) + 1)) {
        if sieve[start] {
            for multiple in range((start * start), (n + 1), start) {
                sieve[multiple] = False;
            }
        }
    }
    return [
        number
        for number in range((n + 1))
        if sieve[number]
    ];
}

