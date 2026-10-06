"""
    Returns the maximum sum of m non-overlapping subarrays of length k.

    :param arr: List[int] - the input array
    :param k: int - length of each subarray
    :param m: int - number of non-overlapping subarrays
    :return: int - maximum sum of m non-overlapping subarrays of length k
    """
def max_sum_of_m_subarrays(arr: list[int], k: int, m: int) -> int {
    n = len(arr);
    if (n < (k * m)) {
        return 0;
    }
    prefix_sums = [0] * (n + 1);
    for i in range(n) {
        prefix_sums[(i + 1)] = prefix_sums[i] + arr[i];
    }
    dp = [([0] * (m + 1)) for _ in range((n + 1))];
    for j in range(1, (m + 1)) {
        for i in range((k * j), (n + 1)) {
            dp[i][j] = max(
                dp[(i - 1)][j],
                ((dp[(i - k)][(j - 1)] + prefix_sums[i]) - prefix_sums[(i - k)])
            );
        }
    }
    return dp[n][m];
}

