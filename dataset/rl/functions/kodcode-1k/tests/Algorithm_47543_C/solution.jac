"""
    Calculates the factorial of a non-negative integer n.
    """
def calculate_factorial(n: int) -> int {
    if (n == 0) {
        return 1;
    }
    factorial = 1;
    for i in range(1, (n + 1)) {
        factorial *= i;
    }
    return factorial;
}

