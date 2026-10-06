"""
    Determines if there are two distinct indices `i` and `j` in the array such that
    nums[i] + nums[j] == k and the absolute difference between `i` and `j` is not
    greater than `d`.

    Args:
    nums (list of int): The input list of integers.
    k (int): The target sum.
    d (int): The maximum allowed distance between indices.

    Returns:
    bool: True if such indices exist, False otherwise.
    """
def check_indices_with_sum(nums: list[int], k: int, d: int) -> bool {
    for i in range(len(nums)) {
        for j in range((i + 1), min((i + d + 1), len(nums))) {
            if ((nums[i] + nums[j]) == k) {
                return True;
            }
        }
    }
    return False;
}

