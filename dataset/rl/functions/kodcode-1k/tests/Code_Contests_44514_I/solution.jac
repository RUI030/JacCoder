"""
    Returns the maximum possible sum of the values of the cards that Alice can achieve
    if both players (Alice and Bob) play optimally.
    """
def max_sum_alice(n: int) -> int {
    sum_alice = 0;
    for i in range((n - 1), -1, -2) {
        sum_alice += i + 1;
    }
    return sum_alice;
}

