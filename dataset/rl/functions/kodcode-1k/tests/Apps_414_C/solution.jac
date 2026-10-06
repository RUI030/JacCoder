def longestIncreasingSequence(nums: list[int]) -> list[int] {
    if not nums {
        return [];
    }
    max_len = 0;
    current_len = 1;
    longest_seq_start = 0;
    current_start = 0;
    for i in range(1, len(nums)) {
        if (nums[i] > nums[(i - 1)]) {
            current_len += 1;
        } else {
            if (current_len > max_len) {
                max_len = current_len;
                longest_seq_start = current_start;
            }
            current_len = 1;
            current_start = i;
        }
    }
    if (current_len > max_len) {
        max_len = current_len;
        longest_seq_start = current_start;
    }
    return nums[longest_seq_start:(longest_seq_start + max_len)];
}

