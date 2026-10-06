"""
    Determines if a number n is square-free.
    A number is square-free if it is not divisible by any perfect square other than 1.

    :param n: integer to check (1 ≤ n ≤ 10^6)
    :return: "YES" if the number is square-free, "NO" otherwise.
    """
def is_square_free(n: int) -> str {
    i = 2;
    while ((i * i) <= n) {
        if ((n % (i * i)) == 0) {
            return "NO";
        }
        i += 1;
    }
    return "YES";
}

