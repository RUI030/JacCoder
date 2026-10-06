"""
    Returns the lexicographically smallest string possible by replacing one character in the string S.
    """
def lexicographically_smallest_string(S: str) -> str {
    n = len(S);
    for i in range(n) {
        for c in 'a' {
            if (S[i] != c) {
                new_string = S[:i] + c + S[(i + 1):];
                return new_string;
            }
        }
    }
    return S;
}

