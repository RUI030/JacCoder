"""
    Returns the sum of a and b if the sum is even;
    otherwise, returns the product of a and b.
    """
def sum_or_product(a: int, b: int) -> int {
    sum_ab = a + b;
    if ((sum_ab % 2) == 0) {
        return sum_ab;
    } else {
        return (a * b);
    }
}

