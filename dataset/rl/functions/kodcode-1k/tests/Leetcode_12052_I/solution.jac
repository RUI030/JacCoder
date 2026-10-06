"""
    Returns the length of the longest winning streak in the series.
    A winning streak is when each score is greater than the preceding score.
    """
def longest_winning_streak(nums: list[int]) -> int {
    if not nums {
        return 0;
    }
    max_streak = 0;
    current_streak = 0;
    for i in range(1, len(nums)) {
        if (nums[i] > nums[(i - 1)]) {
            current_streak += 1;
            max_streak = max(max_streak, current_streak);
        } else {
            current_streak = 0;
        }
    }
    return 0 if (max_streak == 0) else (max_streak + 1);
}

