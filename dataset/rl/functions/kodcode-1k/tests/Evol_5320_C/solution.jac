"""
    Finds all unique quadruplets in the array which gives the sum of target.

    Args:
    nums : List[int] -- list of integers
    target : int -- target integer

    Returns:
    List[List[int]] -- list of quadruplets
    """
def four_sum(nums: list[int], target: int) -> list[list[int]] {
    nums.sort();
    n = len(nums);
    quadruplets = [];
    for i in range(n) {
        if ((i > 0) and (nums[i] == nums[(i - 1)])) {
            continue;
        }
        for j in range((i + 1), n) {
            if ((j > (i + 1)) and (nums[j] == nums[(j - 1)])) {
                continue;
            }
            (left, right) = ((j + 1), (n - 1));
            while (left < right) {
                total = nums[i] + nums[j] + nums[left] + nums[right];
                if (total == target) {
                    quadruplets.append([nums[i], nums[j], nums[left], nums[right]]);
                    while ((left < right) and (nums[left] == nums[(left + 1)])) {
                        left += 1;
                    }
                    while ((left < right) and (nums[right] == nums[(right - 1)])) {
                        right -= 1;
                    }
                    left += 1;
                    right -= 1;
                } elif (total < target) {
                    left += 1;
                } else {
                    right -= 1;
                }
            }
        }
    }
    return quadruplets;
}

