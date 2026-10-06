import from typing { List }
"""
    Returns the maximum amount of money you can rob tonight without alerting the police.
    You cannot rob two adjacent houses.
    """
def rob(nums: list[int]) -> int {
    if not nums {
        return 0;
    } elif (len(nums) == 1) {
        return nums[0];
    }
    prev_max = 0;
    curr_max = 0;
    for num in nums {
        temp = curr_max;
        curr_max = max((prev_max + num), curr_max);
        prev_max = temp;
    }
    return curr_max;
}

