"""
    Returns the length of the longest strictly increasing subsequence in the given array of integers.
    """
def longest_increasing_subsequence(array: list[int]) -> int {
    if not array {
        return 0;
    }
    dp = [1] * len(array);
    for i in range(1, len(array)) {
        for j in range(i) {
            if (array[i] > array[j]) {
                dp[i] = max(dp[i], (dp[j] + 1));
            }
        }
    }
    return max(dp);
}

