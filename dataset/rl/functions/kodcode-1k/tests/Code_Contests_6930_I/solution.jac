"""
    Return the number of ways Alice can buy consecutive books such that
    the length of the consecutive sequence is less than or equal to K.
    """
def count_ways(N: int, K: int) -> int {
    total_ways = 0;
    for x in range(1, (K + 1)) {
        total_ways += (N - x) + 1;
    }
    return total_ways;
}

