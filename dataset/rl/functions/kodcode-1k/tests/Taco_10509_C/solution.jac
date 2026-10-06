"""
    Determines if the characters of string `s` can be rearranged to form a palindrome.

    Parameters:
    s (str): A string consisting of lowercase English characters

    Returns:
    str: "YES" if it's possible to rearrange the characters to form a palindrome, "NO" otherwise
    """
def canFormPalindrome(s: str) -> str {
    import from collections { Counter }
    char_count = Counter(s);
    odd_count = sum(
        1
        for count in char_count.values()
        if ((count % 2) != 0)
    );
    return "YES" if (odd_count <= 1) else "NO";
}

