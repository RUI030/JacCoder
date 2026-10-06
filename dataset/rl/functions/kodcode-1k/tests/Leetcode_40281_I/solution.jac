"""
    Returns the number of harmonious pairs where nums[i] + nums[j] == k and i < j.
    """
def count_harmonious_pairs(nums: list[int], k: int) -> int {
    count = 0;
    seen = {};
    for (index, num) in enumerate(nums) {
        complement = k - num;
        if (complement in seen) {
            count += seen[complement];
        }
        if (num in seen) {
            seen[num] += 1;
        } else {
            seen[num] = 1;
        }
    }
    return count;
}

