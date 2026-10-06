"""
    Find the maximum possible sum of the powers of any three different trees.

    Parameters:
    N (int): The number of trees.
    powers (list of int): The list of integers representing the magical powers of the trees.

    Returns:
    int: The maximum possible sum of the powers of any three different trees.
    """
def max_sum_of_three_trees(N: int, powers: list[int]) -> int {
    sorted_powers = sorted(powers, reverse=True);
    return sum(sorted_powers[:3]);
}

