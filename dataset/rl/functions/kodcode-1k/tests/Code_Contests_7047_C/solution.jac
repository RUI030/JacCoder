"""
    Returns the minimum number of passes required for the ball to return to the starting student.
    """
def minimum_passes(n: int, k: int) -> int {
    if ((n % 2) == 0) {
        return (n // 2);
    } else {
        return ((n - 1) // 2);
    }
}

