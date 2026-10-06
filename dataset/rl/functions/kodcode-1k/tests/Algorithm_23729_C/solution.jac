"""
    Determines if any permutation of the input string can form a palindrome.

    Parameters:
    input_string (str): The input string to check.

    Returns:
    bool: True if any permutation can form a palindrome, False otherwise.
    """
def can_form_palindrome(input_string: str) -> bool {
    import from collections { Counter }
    char_count = Counter(input_string);
    odd_count = sum(
        1
        for count in char_count.values()
        if ((count % 2) != 0)
    );
    return (odd_count <= 1);
}

