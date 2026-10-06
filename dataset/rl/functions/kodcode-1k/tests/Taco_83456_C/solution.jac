"""
    Returns the total number of integers divisible by k in the range between a and b inclusive.
    """
def count_divisibles(a: int, b: int, k: int) -> int {
    if ((a % k) == 0) {
        start = a;
    } else {
        start = a + (k - (a % k));
    }
    if ((b % k) == 0) {
        end = b;
    } else {
        end = b - (b % k);
    }
    if ((start > b) or (end < a)) {
        return 0;
    }
    return (((end - start) // k) + 1);
}

