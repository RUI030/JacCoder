"""
    Returns the minimum number of operations required to make all elements in nums equal to target.

    :param nums: List of integers
    :param target: Target integer
    :return: Minimum number of operations
    """
def min_operations_to_target(nums: list[int], target: int) -> int {
    return sum(abs((num - target)) for num in nums);
}

