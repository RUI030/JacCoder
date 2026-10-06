"""
    Computes the amount of trapped rainwater.

    :param nums: List[int]
    :return: int
    """
def trap_rainwater(nums: list[int]) -> int {
    if (len(nums) <= 2) {
        return 0;
    }
    left_max = [0] * len(nums);
    right_max = [0] * len(nums);
    water_trapped = 0;
    left_max[0] = nums[0];
    for i in range(1, len(nums)) {
        left_max[i] = max(left_max[(i - 1)], nums[i]);
    }
    right_max[-1] = nums[-1];
    for i in range((len(nums) - 2), -1, -1) {
        right_max[i] = max(right_max[(i + 1)], nums[i]);
    }
    for i in range(len(nums)) {
        water_trapped += min(left_max[i], right_max[i]) - nums[i];
    }
    return water_trapped;
}

