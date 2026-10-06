"""
    Returns the minimum number of characters to remove to make the string a palindrome with only
    one character having an odd frequency count. Returns -1 if it's not possible.
    """
def min_removals_to_make_valid_palindrome(s: str) -> int {
    import from collections { Counter }
    char_count = Counter(s);
    odd_count = sum(
        1
        for count in char_count.values()
        if ((count % 2) != 0)
    );
    if (odd_count > 1) {
        return (odd_count - 1);
    }
    return 0;
}

