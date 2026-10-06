"""
    Returns a tuple of two distinct elements from the list that add up to the target, or None if no such pair exists.

    Args:
    nums (list of int): The list of integers.
    target (int): The target sum.

    Returns:
    tuple: A tuple containing two integers that add up to the target.
    """
def two_sum(nums: list[int], target: int) -> tuple[int, int] | None {
    num_dict = {};
    for num in nums {
        complement = target - num;
        if (complement in num_dict) {
            return (complement, num);
        }
        num_dict[num] = True;
    }
    return None;
}

