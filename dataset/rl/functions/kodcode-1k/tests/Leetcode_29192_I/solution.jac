"""
    Determines if any permutation of the input string can form a palindrome.

    Args:
    s (str): Input string.

    Returns:
    bool: True if any permutation of the string can form a palindrome, False otherwise.
    """
def is_palindrome_permutation(s: str) -> bool {
    s = s.replace(" ", "").lower();
    char_count = {};
    for char in s {
        if (char in char_count) {
            char_count[char] += 1;
        } else {
            char_count[char] = 1;
        }
    }
    odd_count = 0;
    for count in char_count.values() {
        if ((count % 2) != 0) {
            odd_count += 1;
        }
        if (odd_count > 1) {
            return False;
        }
    }
    return True;
}

