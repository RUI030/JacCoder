"""
    Returns the minimum possible dissatisfaction score that can be achieved by rearranging the elements of the array.
    The minimum dissatisfaction score can be achieved by sorting the array.
    """
def minimum_dissatisfaction_score(n: int, a: list[int]) -> int {
    if (n <= 1) {
        return 0;
    }
    a.sort();
    dissatisfaction_score = 0;
    for i in range(1, n) {
        dissatisfaction_score += abs((a[i] - a[(i - 1)]));
    }
    return dissatisfaction_score;
}

