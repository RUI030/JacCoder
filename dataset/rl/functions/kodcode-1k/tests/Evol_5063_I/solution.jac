"""
    Calculate the minimum number of operations required to convert
    a given string into a palindrome. An operation is defined as
    changing one letter of the string to any other letter.
    """
def min_operations_to_palindrome(s: str) -> int {
    n = len(s);
    operations = 0;
    for i in range((n // 2)) {
        if (s[i] != s[(n - i - 1)]) {
            operations += 1;
        }
    }
    return operations;
}

