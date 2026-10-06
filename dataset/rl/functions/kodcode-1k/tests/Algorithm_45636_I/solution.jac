"""
    Determines if any permutation of the input string can form a palindrome.
    """
def can_form_palindrome(s: str) -> bool {
    normalized_s = ''.join(
        char.lower()
        for char in s
        if char.isalnum()
    );
    char_count = {};
    for char in normalized_s {
        if (char in char_count) {
            char_count[char] += 1;
        } else {
            char_count[char] = 1;
        }
    }
    odd_count = sum(
        1
        for count in char_count.values()
        if ((count % 2) != 0)
    );
    return (odd_count <= 1);
}

