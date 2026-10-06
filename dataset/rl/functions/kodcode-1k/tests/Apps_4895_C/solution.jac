import from collections { Counter }
"""
    Returns True if any permutation of the string can form a palindrome, otherwise False.
    """
def is_palindrome_permutation(s: str) -> bool {
    char_count = Counter(s);
    odd_count = sum(
        1
        for count in char_count.values()
        if ((count % 2) != 0)
    );
    return (odd_count <= 1);
}

