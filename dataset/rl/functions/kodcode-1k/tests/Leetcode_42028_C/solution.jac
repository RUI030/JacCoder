import itertools;
"""
    Returns the kth lexicographical string of length n consisting of characters 'a' and 'b'.
    If k is greater than the total number of such possible strings, return an empty string.
    """
def kth_lexicographical_string(n: int, k: int) -> str {
    total_combinations = 2 ** n;
    if (k > total_combinations) {
        return "";
    }
    all_strings = sorted("".join(seq) for seq in itertools.product('ab', repeat=n));
    return all_strings[(k - 1)];
}

