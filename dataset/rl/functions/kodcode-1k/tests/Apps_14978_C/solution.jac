"""
    Checks whether there are two distinct indices i and j in the array such that nums[i] = nums[j]
    and the absolute difference between i and j is at most k.

    Args:
    nums: List[int] - an array of integers.
    k: int - the maximum allowed index difference.

    Returns:
    bool - True if such elements exist, otherwise False.
    """
def contains_nearby_duplicate(nums: list[int], k: int) -> bool {
    num_indices = {};
    for (i, num) in enumerate(nums) {
        if ((num in num_indices) and ((i - num_indices[num]) <= k)) {
            return True;
        }
        num_indices[num] = i;
    }
    return False;
}

