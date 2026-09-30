def binary_search(nums: list[int], target: int) -> int {
    lo = 0;
    hi = len(nums);
    while lo < hi {
        mid = (lo + hi) // 2;
        if nums[mid] < target {
            lo = mid + 1;
        } else {
            hi = mid;
        }
    }
    if lo < len(nums) and nums[lo] == target {
        return lo;
    }
    return -1;
}
