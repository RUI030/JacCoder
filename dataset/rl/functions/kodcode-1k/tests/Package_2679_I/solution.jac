"""
    Determine if a permutation of the input string can form a palindrome.

    Args:
    s (str): The input string containing alphanumeric characters, spaces, and punctuation.

    Returns:
    bool: True if any permutation of the string can form a palindrome, otherwise False.
    """
def can_form_palindrome(s: str) -> bool {
    import from collections { Counter }
    import re;
    cleaned_str = re.sub(r'[^a-z0-9]', '', s.lower());
    char_count = Counter(cleaned_str);
    odd_count = sum(
        1
        for count in char_count.values()
        if ((count % 2) != 0)
    );
    return (odd_count <= 1);
}

