"""
    Returns the difference between the largest and smallest values in the list.
    If the list is empty, returns 0.
    """
def difference_between_extremes(nums: list[int]) -> int {
    if not nums {
        return 0;
    }
    return (max(nums) - min(nums));
}

