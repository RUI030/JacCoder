"""
    Returns the indices of the two distinct numbers in the list nums that sum up to the target.
    If no such pair exists, returns an empty list.
    """
def find_two_sum(nums: list[int], target: int) -> list[int] {
    num_to_index = {};
    for (index, num) in enumerate(nums) {
        complement = target - num;
        if (complement in num_to_index) {
            return [num_to_index[complement], index];
        }
        num_to_index[num] = index;
    }
    return [];
}

