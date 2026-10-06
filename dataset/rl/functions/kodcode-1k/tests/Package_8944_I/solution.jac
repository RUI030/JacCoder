"""
    Determines the minimum number of cuts needed to partition a string such that each substring is a palindrome.
    """
def min_palindrome_cuts(s: str) -> int {
    n = len(s);
    if (n <= 1) {
        return 0;
    }
    is_palindrome = [([False] * n) for _ in range(n)];
    for i in range(n) {
        is_palindrome[i][i] = True;
    }
    for length in range(2, (n + 1)) {
        for i in range(((n - length) + 1)) {
            j = (i + length) - 1;
            if (s[i] == s[j]) {
                if (j == (i + 1)) {
                    is_palindrome[i][j] = True;
                } else {
                    is_palindrome[i][j] = is_palindrome[(i + 1)][(j - 1)];
                }
            }
        }
    }
    cuts = [0] * n;
    for i in range(n) {
        if is_palindrome[0][i] {
            cuts[i] = 0;
        } else {
            cuts[i] = min(
                (cuts[j] + 1)
                for j in range(i)
                if is_palindrome[(j + 1)][i]
            );
        }
    }
    return cuts[-1];
}

