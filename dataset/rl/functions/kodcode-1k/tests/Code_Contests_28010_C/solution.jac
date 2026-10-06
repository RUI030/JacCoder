"""
    Determines if it is possible to rearrange the digits of N to form a palindrome.

    Parameters:
    N (int): The input number.

    Returns:
    str: "YES" if the digits can be rearranged to form a palindrome, "NO" otherwise.
    """
def can_form_palindrome(N: int) -> str {
    import from collections { Counter }
    digit_count = Counter(str(N));
    odd_count = sum(
        1
        for count in digit_count.values()
        if ((count % 2) != 0)
    );
    return "YES" if (odd_count <= 1) else "NO";
}

