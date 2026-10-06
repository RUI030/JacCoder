"""
    Returns True if all numbers in each sliding window of length k are unique.
    """
def all_unique_in_sliding_window(nums: list[int], k: int) -> bool {
    if (k > len(nums)) {
        return False;
    }
    num_set = `set();
    for i in range(len(nums)) {
        if (i >= k) {
            num_set.remove(nums[(i - k)]);
        }
        if (nums[i] in num_set) {
            return False;
        }
        num_set.add(nums[i]);
    }
    return True;
}

