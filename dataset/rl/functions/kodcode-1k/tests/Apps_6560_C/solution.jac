"""
    Finds the element that appears only once in the array.
    Args:
    nums: List[int]
        List of integers where every element appears twice except for one.

    Returns:
    int
        The single element that appears only once.
    """
def single_number(nums: list[int]) -> int {
    result = 0;
    for num in nums {
        result ^= num;
    }
    return result;
}

