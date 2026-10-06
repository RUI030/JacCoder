"""
    Returns the length of the longest increasing subsequence (LIS) in the list of book heights.
    """
def length_of_lis(books: list[int]) -> int {
    if not books {
        return 0;
    }
    n = len(books);
    dp = [1] * n;
    for i in range(1, n) {
        for j in range(i) {
            if (books[i] > books[j]) {
                dp[i] = max(dp[i], (dp[j] + 1));
            }
        }
    }
    return max(dp);
}

