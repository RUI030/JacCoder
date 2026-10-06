import from typing { List }
"""
    This function takes a list of non-negative integers and finds the maximum possible
    sum of the remaining sequence after removing any two consecutive items and
    replacing them with their sum.
    """
def maximize_sum(sequence: list[int]) -> int {
    n = len(sequence);
    max_sum = -1;
    total_sum = sum(sequence);
    for i in range((n - 1)) {
        new_sum = (
            (total_sum - (sequence[i] + sequence[(i + 1)]))
            + (sequence[i] + sequence[(i + 1)])
        );
        if (new_sum > max_sum) {
            max_sum = new_sum;
        }
    }
    return max_sum;
}

