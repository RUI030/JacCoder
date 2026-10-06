"""
    Returns the indices of the two numbers such that they add up to target.

    Args:
    nums: List[int] - list of integers
    target: int - target integer sum

    Returns:
    List[int] - list of indices of the two numbers that add up to target
    """
def two_sum(nums: list[int], target: int) -> list[int] {
    num_dict = {};
    for (i, num) in enumerate(nums) {
        complement = target - num;
        if (complement in num_dict) {
            return [num_dict[complement], i];
        }
        num_dict[num] = i;
    }
    return [];
}

