"""
    Determine the minimum number of operations required to make the list strictly increasing.

    An operation consists of choosing any element of the list and replacing it with any other integer.

    :param sequence: List[int] - list of integers
    :return: int - minimum number of operations
    """
def min_operations_to_strictly_increasing(sequence: list[int]) -> int {
    n = len(sequence);
    if (n <= 1) {
        return 0;
    }
    dp = [1] * n;
    for i in range(1, n) {
        for j in range(i) {
            if (sequence[j] < sequence[i]) {
                dp[i] = max(dp[i], (dp[j] + 1));
            }
        }
    }
    lis_length = max(dp);
    return (n - lis_length);
}

