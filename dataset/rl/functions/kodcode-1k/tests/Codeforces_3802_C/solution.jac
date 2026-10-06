"""
    Determine the length of the longest possible special subsequence from the given string s,
    where characters are non-repeating and in alphabetical order.
    """
def longest_special_subsequence_length(s: str) -> int {
    last_seen = `set();
    special_subsequence = [];
    for char in s {
        if (char not in last_seen) {
            if (not special_subsequence or (special_subsequence[-1] < char)) {
                special_subsequence.append(char);
                last_seen.add(char);
            }
        }
    }
    return len(special_subsequence);
}

