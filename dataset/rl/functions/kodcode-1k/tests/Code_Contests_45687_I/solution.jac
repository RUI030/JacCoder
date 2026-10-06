"""
    Determines if the number n can be expressed as the sum of squares of two non-negative integers
    """
def is_special_number(n: int) -> str {
    import math;
    for a in range((int(math.sqrt(n)) + 1)) {
        b_squared = n - (a ** 2);
        if (b_squared >= 0) {
            b = int(math.sqrt(b_squared));
            if ((b * b) == b_squared) {
                return "YES";
            }
        }
    }
    return "NO";
}

