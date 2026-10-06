def max_diff_in_contiguous_subarray(nums: list[int]) -> int {
    if (len(nums) < 2) {
        return 0;
    }
    max_diff = 0;
    for i in range(len(nums)) {
        current_min = nums[i];
        current_max = nums[i];
        for j in range(i, len(nums)) {
            current_min = min(current_min, nums[j]);
            current_max = max(current_max, nums[j]);
            max_diff = max(max_diff, (current_max - current_min));
        }
    }
    return max_diff;
}

