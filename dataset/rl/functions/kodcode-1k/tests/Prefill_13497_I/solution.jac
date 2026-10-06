"""
    Returns the sum of numbers from 1 to n using a for loop.

    Parameters:
    n (int): The upper limit of the range to sum.

    Returns:
    int: The sum of numbers from 1 to n.
    """
def sum_of_numbers(n: int) -> int {
    total = 0;
    for i in range(1, (n + 1)) {
        total += i;
    }
    return total;
}

