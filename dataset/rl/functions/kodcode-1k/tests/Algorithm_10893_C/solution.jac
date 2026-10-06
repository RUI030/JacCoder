"""
    Counts the number of contiguous substrings containing an equal number of 0s and 1s.
    """
def count_binary_substrings(s: str) -> int {
    groups = [];
    current_count = 1;
    for i in range(1, len(s)) {
        if (s[i] == s[(i - 1)]) {
            current_count += 1;
        } else {
            groups.append(current_count);
            current_count = 1;
        }
    }
    groups.append(current_count);
    result = 0;
    for i in range(1, len(groups)) {
        result += min(groups[(i - 1)], groups[i]);
    }
    return result;
}

