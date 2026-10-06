"""
    Determines the length of the longest contiguous subsequence where all integers
    have the same parity (either all even or all odd).

    Args:
    n (int): The length of the sequence.
    sequence (list of int): The list of integers in the sequence.

    Returns:
    int: The length of the longest contiguous subsequence with the same parity.
    """
def longest_contiguous_subsequence_same_parity(n: int, sequence: list[int]) -> int {
    if (n == 0) {
        return 0;
    }
    max_length = 1;
    current_length = 1;
    for i in range(1, n) {
        if ((sequence[i] % 2) == (sequence[(i - 1)] % 2)) {
            current_length += 1;
            max_length = max(max_length, current_length);
        } else {
            current_length = 1;
        }
    }
    return max_length;
}

