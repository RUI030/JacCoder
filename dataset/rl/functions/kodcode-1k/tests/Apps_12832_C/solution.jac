"""
    Finds the length of the longest segment in string s where the segment consists of an equal number of
    two distinct characters.

    Parameters:
        s (str): The input string consisting of lowercase letters.

    Returns:
        int: The length of the longest segment.
    """
def longest_equal_char_segment(s: str) -> int {
    max_len = 0;
    for i in range(len(s)) {
        count = {};
        for j in range(i, len(s)) {
            if (s[j] in count) {
                count[s[j]] += 1;
            } else {
                count[s[j]] = 1;
            }
            if (len(count) > 2) {
                break;
            }
            if ((len(count) == 2) and (count[s[i]] == count[s[j]])) {
                max_len = max(max_len, ((j - i) + 1));
            }
        }
    }
    return max_len;
}

