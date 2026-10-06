"""
    Returns the minimum cost to make the string s a palindrome
    with the given costs for swap (x) and replacement (y).
    """
def min_cost_to_make_palindrome(n: int, x: int, y: int, s: str) -> int {
    cost = 0;
    for i in range((n // 2)) {
        left_char = s[i];
        right_char = s[(n - i - 1)];
        if (left_char != right_char) {
            cost += min(x, y);
        }
    }
    return cost;
}

