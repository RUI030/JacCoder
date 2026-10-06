"""
    Compute the minimum steps required to reduce a given positive integer n to 1.

    Parameters:
    n (int): A positive integer.

    Returns:
    int: The minimum number of steps required to reduce the integer to 1.
    """
def min_steps_to_one(n: int) -> int {
    if (n == 1) {
        return 0;
    }
    dp = [0] * (n + 1);
    for i in range(2, (n + 1)) {
        dp[i] = dp[(i - 1)] + 1;
        if ((i % 2) == 0) {
            dp[i] = min(dp[i], (dp[(i // 2)] + 1));
        }
        if ((i % 3) == 0) {
            dp[i] = min(dp[i], (dp[(i // 3)] + 1));
        }
    }
    return dp[n];
}

