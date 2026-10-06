"""
    Generates a sequence pattern based on the given integer n.

    Args:
    n (int): The integer to generate the sequence.

    Returns:
    str: The generated sequence as a string.
    """
def generate_sequence(n: int) -> str {
    if (n <= 0) {
        return "";
    } else {
        return "-".join(str(i) for i in range(1, (n + 1)));
    }
}

