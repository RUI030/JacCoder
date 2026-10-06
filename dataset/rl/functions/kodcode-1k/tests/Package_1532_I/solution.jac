"""
    Determines if the given string can be permuted to form a palindrome.

    :param s: input string
    :return: True if any permutation of the string can form a palindrome, False otherwise
    """
def can_form_palindrome(s: str) -> bool {
    import from collections { defaultdict }
    char_count = defaultdict(int);
    for char in s {
        char_count[char] += 1;
    }
    odd_count = 0;
    for count in char_count.values() {
        if ((count % 2) != 0) {
            odd_count += 1;
        }
    }
    return (odd_count <= 1);
}

