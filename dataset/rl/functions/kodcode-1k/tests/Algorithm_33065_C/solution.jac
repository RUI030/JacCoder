"""
    Calculate the number of distinct ways to climb a staircase of n steps,
    where at each step, you can either climb 1, 2, or 3 steps.
    """
def climb_stairs(n: int) -> int {
    if (n == 1) {
        return 1;
    } elif (n == 2) {
        return 2;
    } elif (n == 3) {
        return 4;
    }
    dp = [0] * (n + 1);
    dp[1] = 1;
    dp[2] = 2;
    dp[3] = 4;
    for i in range(4, (n + 1)) {
        dp[i] = dp[(i - 1)] + dp[(i - 2)] + dp[(i - 3)];
    }
    return dp[n];
}

