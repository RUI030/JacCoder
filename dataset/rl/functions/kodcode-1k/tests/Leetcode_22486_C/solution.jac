"""
    Returns the number of distinct substrings of length k in s.
    """
def max_distinct_substrings(s: str, k: int) -> int {
    if (k > len(s)) {
        return 0;
    }
    distinct_substrings = `set();
    for i in range(((len(s) - k) + 1)) {
        substring = s[i:(i + k)];
        if (len(`set(substring)) == k) {
            distinct_substrings.add(substring);
        }
    }
    return len(distinct_substrings);
}

