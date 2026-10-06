"""
    Determines if the given string is a permutation of a palindrome.

    Args:
    s (str): Input string.

    Returns:
    bool: True if the string is a permutation of a palindrome, False otherwise.
    """
def is_permutation_of_palindrome(s: str) -> bool {
    import from collections { Counter }
    filtered_s = ''.join(
        c.lower()
        for c in s
        if c.isalpha()
    );
    counter = Counter(filtered_s);
    odd_count = sum(
        1
        for count in counter.values()
        if ((count % 2) == 1)
    );
    return (odd_count <= 1);
}

