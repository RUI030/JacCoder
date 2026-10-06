"""
    Returns a new list with the elements of nums rotated to the right by k positions.
    """
def rotate_list(nums: list[int], k: int) -> list[int] {
    if not nums {
        return [];
    }
    k = k % len(nums);
    return (nums[-k:] + nums[:-k]);
}

