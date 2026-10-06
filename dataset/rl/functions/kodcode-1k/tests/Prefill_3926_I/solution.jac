"""
    Returns the factorial of a given number. If the number is 0, returns 1.
    If the number is negative, returns None.
    """
def calculate_factorial(number: int) -> int | None {
    if (number < 0) {
        return None;
    } elif (number == 0) {
        return 1;
    } else {
        factorial = 1;
        for i in range(1, (number + 1)) {
            factorial *= i;
        }
        return factorial;
    }
}

