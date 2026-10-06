"""
    Returns the number of times the substring t appears in the concatenated result of the strings after performing
    each of the k cyclic right shifts on the string s.
    """
def count_substring_occurrences(k: int, s: str, t: str) -> int {
    n = len(s);
    concatenated_result = (s * 2)[-n:] * k;
    return concatenated_result.count(t);
}

