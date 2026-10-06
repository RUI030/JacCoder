"""
    Returns the maximum product obtained by multiplying any three distinct integers from the list.
    If there are fewer than three integers in the list, returns 0.

    Parameters:
    numbers (list): A list of integers.

    Returns:
    int: The maximum product of three distinct integers from the list.
    """
def maximum_product_of_three(numbers: list[int]) -> int {
    if (len(numbers) < 3) {
        return 0;
    }
    numbers.sort();
    max_product1 = numbers[-1] * numbers[-2] * numbers[-3];
    max_product2 = numbers[0] * numbers[1] * numbers[-1];
    return max(max_product1, max_product2);
}

