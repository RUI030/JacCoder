"""
    Determines if there exists a permutation of the string that forms a palindrome.
    """
def can_form_palindrome(s: str) -> bool {
    import from collections { Counter }
    freq = Counter(s);
    odd_count = sum(
        1
        for count in freq.values()
        if ((count % 2) != 0)
    );
    return (odd_count <= 1);
}

