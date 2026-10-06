"""
    Rotates the list to the right by k steps.

    Parameters:
    nums (list of int): The list of integers to be rotated.
    k (int): The number of steps to rotate the list to the right.

    Returns:
    list of int: The rotated list.
    """
def rotate_list(nums: list[int], k: int) -> list[int] {
    if not nums {
        return nums;
    }
    n = len(nums);
    k = k % n;
    if (k == 0) {
        return nums;
    }
    return (nums[-k:] + nums[:-k]);
}

