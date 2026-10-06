"""
    Calculate the number of ways to reach the top of a staircase with given steps.

    :param steps: int - number of steps to reach the top
    :param allowed_steps: List[int] - list of allowed steps that can be climbed at a time
    :return: int - number of distinct ways to reach the top
    """
def climb_stairs_custom(steps: int, allowed_steps: list[int]) -> int {
    dp = [0] * (steps + 1);
    dp[0] = 1;
    for i in range(1, (steps + 1)) {
        for step in allowed_steps {
            if ((i - step) >= 0) {
                dp[i] += dp[(i - step)];
            }
        }
    }
    return dp[steps];
}

