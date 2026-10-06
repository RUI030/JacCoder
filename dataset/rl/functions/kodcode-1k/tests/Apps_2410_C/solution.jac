"""
    Returns the list sorted in alternating high and low order.
    The first integer is the largest, the second is the smallest,
    the third is the second largest, and so on.
    """
def maximizeDifference(nums: list[int]) -> list[int] {
    nums.sort();
    result = [];
    while nums {
        if nums {
            result.append(nums.pop(-1));
        }
        if nums {
            result.append(nums.pop(0));
        }
    }
    return result;
}

