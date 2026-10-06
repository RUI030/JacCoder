import from typing { List, Tuple }
"""
    Returns a list of all unique pairs of factors of `n` excluding (1, n) and (n, 1).
    """
def factor_pairs(n: int) -> list[tuple[int, int]] {
    result = [];
    for a in range(2, (int((n ** 0.5)) + 1)) {
        if ((n % a) == 0) {
            b = n // a;
            if (a <= b) {
                result.append((a, b));
            }
        }
    }
    return result;
}

