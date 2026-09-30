def max_subarray(nums: list[int]) -> int {
    best = nums[0];
    cur = nums[0];
    for n in nums[1:] {
        cur = max(n, cur + n);
        best = max(best, cur);
    }
    return best;
}
