"""
    Returns the sum of a list of numbers using recursion.
    """
def recursive_sum(numbers: list[int]) -> int {
    if not numbers {
        return 0;
    }
    return (numbers[0] + recursive_sum(numbers[1:]));
}

