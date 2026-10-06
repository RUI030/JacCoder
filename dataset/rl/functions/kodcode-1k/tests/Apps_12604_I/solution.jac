"""
    Returns the length of the longest sequence of consecutive integers.
    """
def longest_consecutive_sequence(arr: list[int]) -> int {
    if not arr {
        return 0;
    }
    num_set = `set(arr);
    longest_streak = 0;
    for num in arr {
        if ((num - 1) not in num_set) {
            current_num = num;
            current_streak = 1;
            while ((current_num + 1) in num_set) {
                current_num += 1;
                current_streak += 1;
            }
            longest_streak = max(longest_streak, current_streak);
        }
    }
    return longest_streak;
}

