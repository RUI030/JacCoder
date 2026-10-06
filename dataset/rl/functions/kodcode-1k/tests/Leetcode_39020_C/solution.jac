"""
    Calculate the maximum amount of money the thief can rob without triggering the alarm.

    :param nums: List[int] - A list of integers representing the amount of money in each house along a street.
    :return: int - The maximum amount of money that can be robbed.
    """
def rob(nums: list[int]) -> int {
    if not nums {
        return 0;
    }
    if (len(nums) == 1) {
        return nums[0];
    }
    (prev1, prev2) = (0, 0);
    for num in nums {
        temp = prev1;
        prev1 = max((prev2 + num), prev1);
        prev2 = temp;
    }
    return prev1;
}

