"""
    Returns a list of all prime numbers from 1 to n.
    """
def generate_primes(n: int) -> list[int] {
    if (n < 2) {
        return [];
    }
    primes = [];
    for num in range(2, (n + 1)) {
        is_prime = True;
        for divisor in range(2, (int((num ** 0.5)) + 1)) {
            if ((num % divisor) == 0) {
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

