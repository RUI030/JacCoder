"""
    Returns the length of the longest subarray with all distinct elements.
    """
def longest_subarray_with_distinct_elements(nums: list[int]) -> int {
    num_set = `set();
    left = 0;
    max_length = 0;
    for right in range(len(nums)) {
        while (nums[right] in num_set) {
            num_set.remove(nums[left]);
            left += 1;
        }
        num_set.add(nums[right]);
        max_length = max(max_length, ((right - left) + 1));
    }
    return max_length;
}

