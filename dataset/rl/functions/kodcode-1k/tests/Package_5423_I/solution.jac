"""
    Returns the factorial of a given non-negative integer n using recursion.
    """
def factorial_recursive(n: int) -> int {
    if (n == 0) {
        return 1;
    } else {
        return (n * factorial_recursive((n - 1)));
    }
}

