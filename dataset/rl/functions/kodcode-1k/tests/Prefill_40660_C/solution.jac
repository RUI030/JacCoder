"""
    Rotate the array to the right by k steps.

    :param nums: List[int] - The list of numbers to be rotated
    :param k: int - The number of steps to rotate the array
    :return: List[int] - The rotated array
    """
def rotate_array(nums: list[int], k: int) -> list[int] {
    if (not nums or (k <= 0)) {
        return nums;
    }
    n = len(nums);
    k = k % n;
    return (nums[-k:] + nums[:-k]);
}

