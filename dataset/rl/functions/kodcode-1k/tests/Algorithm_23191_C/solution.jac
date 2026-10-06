import from typing { List }
"""
    Determine if there is a subset in the array `arr` with a sum equal to `target`.

    :param arr: List[int] representing the array of integers.
    :param target: int representing the target sum.
    :return: True if a subset with sum equal to `target` exists, False otherwise.
    """
def is_subset_sum(arr: list[int], target: int) -> bool {
    n = len(arr);
    dp = [([False] * (target + 1)) for _ in range((n + 1))];
    for i in range((n + 1)) {
        dp[i][0] = True;
    }
    for i in range(1, (n + 1)) {
        for j in range(1, (target + 1)) {
            if (arr[(i - 1)] > j) {
                dp[i][j] = dp[(i - 1)][j];
            } else {
                dp[i][j] = dp[(i - 1)][j] or dp[(i - 1)][(j - arr[(i - 1)])];
            }
        }
    }
    return dp[n][target];
}

