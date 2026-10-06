"""
    Determines if there exists a subset of the array `arr` with a sum equal to `target`.

    Args:
    n (int): Number of elements in the array.
    target (int): The target sum.
    arr (list of int): The array of elements.

    Returns:
    str: "YES" if there exists a subset that adds up to the target, otherwise "NO".
    """
def subset_sum_exists(n: int, target: int, arr: list[int]) -> str {
    dp = [False] * (target + 1);
    dp[0] = True;
    for num in arr {
        for i in range(target, (num - 1), -1) {
            dp[i] = dp[i] or dp[(i - num)];
        }
    }
    return "YES" if dp[target] else "NO";
}

