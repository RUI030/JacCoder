"""
    Finds the length of the longest consecutive elements sequence in the list.

    Parameters:
    nums (List[int]): A list of integers.

    Returns:
    int: The length of the longest consecutive sequence.
    """
def longest_consecutive_sequence(nums: list[int]) -> int {
    nums_set = `set(nums);
    longest_streak = 0;
    for num in nums {
        if ((num - 1) not in nums_set) {
            current_num = num;
            current_streak = 1;
            while ((current_num + 1) in nums_set) {
                current_num += 1;
                current_streak += 1;
            }
            longest_streak = max(longest_streak, current_streak);
        }
    }
    return longest_streak;
}

