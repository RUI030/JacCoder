"""
    Calculate the number of ways an integer can be decomposed into sums of non-negative integers.

    :param decompose: int - The integer to decompose.
    :return: int - The number of ways to decompose the integer.
    """
def int_divide(decompose: int) -> int {
    dp = [1] + ([0] * decompose);
    for i in range(1, (decompose + 1)) {
        for j in range(i, (decompose + 1)) {
            dp[j] += dp[(j - i)];
        }
    }
    return dp[decompose];
}

