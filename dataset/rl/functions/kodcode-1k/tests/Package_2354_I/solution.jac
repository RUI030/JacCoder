"""
    Returns the product of all unique numbers in the list.
    A number is considered unique if it appears exactly once in the list.

    Args:
    nums (list of int): List of integers.

    Returns:
    int: Product of all unique numbers. 1 if no unique numbers exist.
    """
def product_of_unique_numbers(nums: list[int]) -> int {
    import from collections { Counter }
    counts = Counter(nums);
    unique_numbers = [
        num
        for (num, count) in counts.items()
        if (count == 1)
    ];
    product = 1;
    for num in unique_numbers {
        product *= num;
    }
    return product if unique_numbers else 1;
}

