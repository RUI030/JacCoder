import from typing { List }
"""
    Returns the maximum amount of money that can be robbed without robbing two adjacent houses.
    """
def rob(nums: list[int]) -> int {
    if not nums {
        return 0;
    }
    if (len(nums) == 1) {
        return nums[0];
    }
    (rob1, rob2) = (0, 0);
    for n in nums {
        new_rob = max((rob1 + n), rob2);
        rob1 = rob2;
        rob2 = new_rob;
    }
    return rob2;
}

