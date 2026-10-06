"""
    Checks if any permutation of the input string can form a palindrome.
    """
def can_permute_palindrome(s: str) -> bool {
    import from collections { Counter }
    char_count = Counter(s);
    odd_count = 0;
    for count in char_count.values() {
        if ((count % 2) != 0) {
            odd_count += 1;
        }
    }
    return (odd_count <= 1);
}

