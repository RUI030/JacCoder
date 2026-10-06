"""
    Function to find the length of the longest common subsequence (LCS)
    between two strings `a` and `b`, where string `b` contains all unique characters.
    """
def longest_common_subsequence(a: str, b: str) -> int {
    (m, n) = (len(a), len(b));
    table = [([0] * (n + 1)) for _ in range((m + 1))];
    for i in range(1, (m + 1)) {
        for j in range(1, (n + 1)) {
            if (a[(i - 1)] == b[(j - 1)]) {
                table[i][j] = table[(i - 1)][(j - 1)] + 1;
            } else {
                table[i][j] = max(table[(i - 1)][j], table[i][(j - 1)]);
            }
        }
    }
    return table[m][n];
}

