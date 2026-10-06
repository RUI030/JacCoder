"""
    Determines if a given string can be constructed by repeating a substring of itself.
    """
def is_repeated_substring_pattern(s: str) -> bool {
    n = len(s);
    for i in range(1, ((n // 2) + 1)) {
        if ((n % i) == 0) {
            if ((s[:i] * (n // i)) == s) {
                return True;
            }
        }
    }
    return False;
}

