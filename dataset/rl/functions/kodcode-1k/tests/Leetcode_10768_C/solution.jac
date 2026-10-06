"""
    Checks if the given list can be rearranged to form an arithmetic progression.

    :param nums: List of integers
    :return: Boolean value indicating if the list can form an arithmetic progression
    """
def can_make_arithmetic_progression(nums: list[int]) -> bool {
    if (len(nums) < 2) {
        return True;
    }
    nums.sort();
    diff = nums[1] - nums[0];
    for i in range(2, len(nums)) {
        if ((nums[i] - nums[(i - 1)]) != diff) {
            return False;
        }
    }
    return True;
}

