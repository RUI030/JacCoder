"""
    Returns a list of all prime numbers less than n.
    """
def primes_less_than(n: int) -> list[int] {
    if (n <= 2) {
        return [];
    }
    primes = [];
    for num in range(2, n) {
        is_prime = True;
        for i in range(2, (int((num ** 0.5)) + 1)) {
            if ((num % i) == 0) {
                is_prime = False;
                break;
            }
        }
        if is_prime {
            primes.append(num);
        }
    }
    return primes;
}

