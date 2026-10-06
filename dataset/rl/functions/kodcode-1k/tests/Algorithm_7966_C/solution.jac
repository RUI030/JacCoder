"""
    Returns the maximum number of palindromic substrings that can be formed by rearranging the characters of the string s.
    """
def max_palindromic_substrings(s: str) -> int {
    import from collections { Counter }
    count = Counter(s);
    zeros = count['0'];
    ones = count['1'];
    max_substrings = zeros + ones;
    return max_substrings;
}

