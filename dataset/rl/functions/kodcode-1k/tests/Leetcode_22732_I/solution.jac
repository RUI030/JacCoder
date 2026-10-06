"""
    Returns the number of distinct non-empty substrings of the input string `s` modulo 10^9 + 7.

    Parameters:
    s (str): A string consisting of lowercase English letters.

    Returns:
    int: The number of distinct non-empty substrings of s modulo 10^9 + 7.
    """
def distinct_substrings(s: str) -> int {
    MOD = (10 ** 9) + 7;
    n = len(s);
    substrings = `set();
    for i in range(n) {
        for j in range((i + 1), (n + 1)) {
            substrings.add(s[i:j]);
        }
    }
    return (len(substrings) % MOD);
}

