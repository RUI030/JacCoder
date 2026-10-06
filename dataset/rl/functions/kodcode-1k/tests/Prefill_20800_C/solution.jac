"""
    Returns a list of numbers that appear three or more times in the input list.

    Args:
    nums (list): A list of numbers.

    Returns:
    list: A list of numbers that appear three or more times in the input list.
    """
def frequent_numbers(nums: list[int]) -> list[int] {
    import from collections { Counter }
    num_counts = Counter(nums);
    result = [
        num
        for (num, count) in num_counts.items()
        if (count >= 3)
    ];
    return result;
}

