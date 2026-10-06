"""
    Returns the longest alternating string that starts with 'a' and consists of characters 'a' and 'b'.
    """
def longest_alternating_string(s: str) -> str {
    result = [];
    expected_char = 'a';
    for char in s {
        if (char == expected_char) {
            result.append(char);
            expected_char = 'b' if (expected_char == 'a') else 'a';
        }
    }
    return ''.join(result);
}

