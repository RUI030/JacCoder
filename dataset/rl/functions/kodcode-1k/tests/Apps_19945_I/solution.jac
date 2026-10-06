"""
    Returns True if there are three distinct elements in the list that sum up to T, False otherwise.
    """
def three_sum(nums: list[int], T: int) -> bool {
    nums = `list(`set(nums));
    nums.sort();
    n = len(nums);
    for i in range((n - 2)) {
        left = i + 1;
        right = n - 1;
        while (left < right) {
            current_sum = nums[i] + nums[left] + nums[right];
            if (current_sum == T) {
                return True;
            } elif (current_sum < T) {
                left += 1;
            } else {
                right -= 1;
            }
        }
    }
    return False;
}

