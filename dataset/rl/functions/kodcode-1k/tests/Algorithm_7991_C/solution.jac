"""
    Determine if there exists a subsequence within nums that sums up to the given target.
    """
def subsequence_sum_exists(nums: list[int], target: int) -> bool {
    n = len(nums);
    dp = {0};
    for num in nums {
        new_dp = dp.copy();
        for t in dp {
            new_dp.add((t + num));
        }
        dp = new_dp;
    }
    return (target in dp);
}

