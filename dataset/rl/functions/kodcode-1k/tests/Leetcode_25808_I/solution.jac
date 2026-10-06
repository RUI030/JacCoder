"""
    Returns the sum of all elements in nums that are either even or appear at an even index.

    Args:
    nums (List[int]): A list of integers.

    Returns:
    int: The sum of all elements that are either even or appear at an even index.
    """
def sum_even_nums_or_even_index(nums: list[int]) -> int {
    return sum(
        num
        for (i, num) in enumerate(nums)
        if (((num % 2) == 0) or ((i % 2) == 0))
    );
}
with entry {
    nums = [1, 2, 3, 4, 5, 6];
    result = sum_even_nums_or_even_index(nums);
    print(result);
}

